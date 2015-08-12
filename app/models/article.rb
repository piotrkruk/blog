class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :articles_tags
	has_many :tags, through: :articles_tags
	validates :title, presence: true, length: {minimum: 5}
end
