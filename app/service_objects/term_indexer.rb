class TermIndexer < Struct.new(:fields)
  def index
    fields.reduce(Hash.new(0.0)) do |total, field|
      tokenize(field[:text]).each do |term|
        total[term] += field[:score]
      end

      total
    end
  end

  private

  def tokenize(text)
    text.split(/\W/).map(&:downcase)
  end
end