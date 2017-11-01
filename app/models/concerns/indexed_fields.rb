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