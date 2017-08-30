class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }

  has_many :comments, dependent: :destroy

  def next_article
    Article.where("id > ?", id).order(:id).first
  end

  def capitalize_title
    self.title = title.capitalize
    save!
  end
end
