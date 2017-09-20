RSpec.describe Article do
  it { is_expected.to validate_length_of(:title).is_at_least(5) }
end
