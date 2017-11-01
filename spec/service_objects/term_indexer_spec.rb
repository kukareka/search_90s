RSpec.describe TermIndexer do
  let(:fields) do
    [
      {
          text: 'a fox + fox + 545 foxes and a rabbit  = 547 foxes+rabbit!',
          score: 0.7
      },
      {
          text: 'big&brown/lazy:fox!!!',
          score: 0.5
      },
      {
          text: '',
          score: 0.3
      },
      {
          text: nil,
          score: 0.1
      },
    ]
  end

  subject do
    described_class.new(fields).index
  end

  it do
    is_expected.to eq(
                       "545" => 0.7,
                       "547" => 0.7,
                       "a" => 1.4,
                       "and" => 0.7,
                       "big" => 0.5,
                       "brown" => 0.5,
                       "fox" => 1.9,
                       "foxes" => 1.4,
                       "lazy" => 0.5,
                       "rabbit" => 1.4
                   )
  end
end
