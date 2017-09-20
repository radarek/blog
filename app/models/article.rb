class Article < ApplicationRecord
  # validates :title, length: { minimum: 5 }
  validate :check_title_length
  validates :text, presence: true
  validates :title, uniqueness: true
  validates :text, length: { minimum: 10 }, if: ->(article) { article.title && article.title.ends_with?("!") }

  has_many :comments, dependent: :destroy
  has_many :commenters_ips, through: :comments, source: "ip"
  has_and_belongs_to_many :categories

  scope :younger_than_week, -> { where("created_at > ?", 1.week.ago) }
  scope :with_super_titles, -> { where("title like ?", "%super%") }

  def next_article
    Article.where("id > ?", id).order(:id).first
  end

  def capitalize_title
    self.title = title.capitalize
    save!
  end

  def self.search(q, status, from_date, to_date, order)
    Article.where("title like :query or text like :query", query: "%#{q}%")
  end

  private

  def check_title_length
    if title && title.length < 5
      errors.add(:title, "is too short (minimum is 5 characters)")
    end
  end
end
