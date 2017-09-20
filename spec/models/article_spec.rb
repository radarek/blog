RSpec.describe Article do
  subject { Fabricate.build(:article) }

  it { is_expected.to validate_length_of(:title).is_at_least(5) }
  it { is_expected.to validate_uniqueness_of(:title) }
  it { is_expected.to validate_presence_of(:text) }

  context "when title ends with !" do
    subject { Fabricate.build(:article, title: "Title with exclamation!") }

    it { is_expected.to validate_length_of(:text).is_at_least(10) }
  end

  context "when title doesn't end with !" do
    subject { Fabricate.build(:article, title: "Title without exclamation", text: "short") }

    it { is_expected.to be_valid }
  end
end
