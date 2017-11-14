# The query object was extracted from the model to handle query params and perform the search via model scope.

class DocumentQuery < Struct.new(:query, :types)
  def results
    scope = Document.with_terms(query_terms)
    scope = scope.where(type: document_types) if types.present?
    scope
  end

  def document_types
    types.map(&:singularize).map(&:camelize)
  end

  def query_terms
    Tokenizer.new(query).tokens
  end
end
