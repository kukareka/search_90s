class CreateTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :terms do |t|
      t.string :term
    end

    add_index :terms, :term, unique: true
  end
end
