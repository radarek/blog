class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }

  has_many :comments, dependent: :destroy
  has_many :commenters_ips, through: :comments, source: "ip"

  def next_article
    Article.where("id > ?", id).order(:id).first
  end

  def capitalize_title
    self.title = title.capitalize
    save!
  end
end
