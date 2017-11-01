class Project < Document
  metadata_field :name, score: 10.0
  metadata_field :details, score: 7.0
  metadata_field :url
  metadata_field :external_id

  metadata_field :published, type: :boolean
  metadata_field :_id, type: :integer
  metadata_field :tags, type: :array
  metadata_field :location, type: :array

  metadata_field :created_at, indexed: false
end
