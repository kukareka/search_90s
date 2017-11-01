class Document < ApplicationRecord
  has_many :document_terms, dependent: :destroy

  serialize :metadata, JSON

  after_save :refresh_terms

  private

  def refresh_terms
    terms_for_index = TermIndexer.new(fields_for_index).index
    document_terms.delete_all # document_terms should not have callbacks

    terms_for_index.each do |term, score|
      t = Term.find_or_create_by!(term: term)
      document_terms.create!(term: t, score: score)
    end
  end

  def fields_for_index
    raise NotImplementedError("Implement in subclasses")
  end
end
