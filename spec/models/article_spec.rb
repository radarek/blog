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

  describe "#next_article" do
    context "when article is the last one" do
      let!(:article) { Fabricate(:article) }

      it "returns nil" do
        expect(article.next_article).to eq nil
      end
    end

    context "when article is NOT the last one" do
      let!(:article1) { Fabricate(:article) }
      let!(:article2) { Fabricate(:article) }
      let!(:article3) { Fabricate(:article) }

      it "returns second article" do
        expect(article1.next_article).to eq article2
      end
    end
  end
end
