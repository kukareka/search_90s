class CreateDocumentTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :document_terms do |t|
      t.integer :document_id
      t.integer :term_id
      t.float :score
    end

    add_index :document_terms, :document_id
    add_index :document_terms, :term_id
  end
end
