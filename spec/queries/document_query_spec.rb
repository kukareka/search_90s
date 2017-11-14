RSpec.describe DocumentQuery do

  # All the scenarios use the same set of fixtures, so it makes sense to clear the DB only once.
  before(:all) { DatabaseCleaner.start }
  after(:all) { DatabaseCleaner.clean }

  let!(:project1) do
    Project.create!(metadata: {
        name: 'Nice big project',
        tags: %w(nice),
        _id: 155,
        published: true,
        created_at: 'yesterday'
    })
  end

  let!(:project2) do
    Project.create!(metadata: {
        name: 'Nice Africa project',
        location: %w(africa)
    })
  end

  let!(:user1) do
    User.create!(metadata: {
        name: 'John Doe',
        location: {
            country: 'Africa'
        }
    })
  end

  let!(:user2) do
    User.create!(metadata: {
        name: 'Joni Mitchell',
        alias: 'Not so nice',
        signature: 'It was yesterday'
    })
  end

  let(:types) { nil }

  subject { described_class.new(query, types).results.all }

  context 'Order of results' do
    let(:query) { 'nice' }

    it do
      is_expected.to eq([project1, project2, user2])
    end
  end

  context 'Filter by types' do
    let(:query) { 'nice' }
    let(:types) { %w(projects project) }

    it do
      is_expected.to eq([project1, project2])
    end
  end

  context 'Multiple terms' do
    let(:query) { 'nice project' }

    it { is_expected.to eq([project1, project2]) }
  end

  context 'Search in hashes' do
    let(:query) { 'africa' }

    it { is_expected.to eq([project2, user1]) }
  end

  context 'Search in booleans and ints' do
    let(:query) { 'Published nice big project 155' }

    it { is_expected.to eq([project1]) }
  end

  context 'Ignore skipped fields' do
    let(:query) { 'yesterday?' }

    it { is_expected.to eq([user2]) }
  end

  context 'No results' do
    let(:query) { 'One million dollars' }

    it { is_expected.to be_empty }
  end

  context 'Empty query' do
    let(:query) { '' }

    it { is_expected.to be_empty }
  end
end
