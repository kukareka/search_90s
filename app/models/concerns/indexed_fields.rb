# The most of the magic happens here.
# Text fields are extracted from metadata, tokenized and saved in a "word-bag" format with the field rank ("score").
# Some fields (e. g. name) might have higher rank than the others, it affects the order of appearance in search results.
# The field schema for each entity type is defined via DSL in relevant model classes.
#
# Example:
#
# class User < Document
#   metadata_field :_id, type: :integer
#   metadata_field :active, type: :boolean
#   metadata_field :alias, score: 7.0
#   metadata_field :created_at, indexed: false # Don't index the field - just generate reader method.
# end

module IndexedFields
  extend ActiveSupport::Concern

  included do
    def indexed_fields
      self.class.indexed_fields.try(:map) do |field|
        {
            text: field_text(field),
            score: field[:score]
        }
      end
    end

    def field_text(field)
      name = field[:name]
      value = public_send(name)

      case field[:type]
        when :string
          value.presence
        when :boolean
          value.presence && name.to_s
        when :integer
          value.presence && value.to_s
        when :array
          value.presence && value.join(',')
        when :hash
          value.presence && value.values.join(',')
      end
    end
  end

  class_methods do
    attr_reader :indexed_fields

    def metadata_field(field, type: :string, indexed: true, score: 1.0)
      define_method field do
        metadata[field.to_s]
      end

      if indexed
        @indexed_fields ||= []
        @indexed_fields << {
            name: field,
            type: type,
            score: score
        }
      end
    end
  end
end
