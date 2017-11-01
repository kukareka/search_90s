class DocumentQuery < Struct.new(:query)
  def results
    Document.with_terms(query_terms)
  end

  def query_terms
    Tokenizer.new(query).tokens
  end
end