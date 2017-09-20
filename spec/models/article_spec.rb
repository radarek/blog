require "rails_helper"

RSpec.describe Article do
  describe "title validation" do
    let(:article) { Article.new }

    context "when title length is 5 or more" do
      before do
        article.title = "This is nice title"
      end

      it "is valid" do
        expect(article).to be_valid
      end
    end

    context "when title is too short" do
      before do
        article.title = "abcd"
      end

      it "is invalid" do
        expect(article).to_not be_valid
      end
    end

    context "when title is empty" do
      before do
        article.title = nil
      end

      it "is invalid" do
        expect(article).to_not be_valid
      end
    end
  end
end
