# A model calculates its fields according to the schema and calls the indexer to produce scored word bag.

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
    Tokenizer.new(text).tokens
  end
end
