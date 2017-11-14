class Document < ApplicationRecord
  include IndexedFields

  has_many :document_terms, dependent: :destroy
  has_many :terms, through: :document_terms

  serialize :metadata, JSON

  scope :with_terms, -> (terms) do
    joins(:terms).where(terms: {term: terms}).
        group(:id).                                 # Group terms and scores by document
        order('SUM(document_terms.score) DESC').    # Order by document total score
        having('COUNT(terms.id) = ?', terms.count)  # Select only documents that contain all the terms
  end

  after_save :refresh_terms

  private

  def refresh_terms
    document_terms.delete_all # document_terms should not have callbacks

    TermIndexer.new(indexed_fields).index.each do |term, score|
      t = Term.find_or_create_by!(term: term)
      document_terms.create!(term: t, score: score)
    end
  end
end
