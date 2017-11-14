class User < Document
  metadata_field :_id, type: :integer
  metadata_field :active, type: :boolean
  metadata_field :alias, score: 7.0
  metadata_field :created_at, indexed: false
  metadata_field :email, score: 5.0
  metadata_field :external_id
  metadata_field :last_login_at, indexed: false
  metadata_field :locale
  metadata_field :location, type: :hash
  metadata_field :name, score: 10.0
  metadata_field :organization_id, type: :integer
  metadata_field :phone
  metadata_field :role
  metadata_field :shared, type: :boolean
  metadata_field :signature
  metadata_field :suspended, type: :boolean
  metadata_field :tags, type: :array
  metadata_field :timezone
  metadata_field :verified, type: :boolean
end
