class DocumentTerm < ApplicationRecord
  belongs_to :document
  belongs_to :term

  # IMPORTANT! This class should not have destroy callbacks.
  # The terms for a document are deleted without callbacks.
  # See Document implementation.
end
