class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :articles_tags, dependent: :destroy
	has_many :tags, through: :articles_tags
	validates :title, presence: true, length: {minimum: 5}

  def self.get_by_tag(tag)
    articles = Array.new
    tag = Tag.find(tag)
    articles = Article.all.find_all {
      |a| a.tags.include?(tag)
    }
    return articles
  end


end
