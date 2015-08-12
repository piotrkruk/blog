class ArticlesTag < ActiveRecord::Base
	belongs_to :articles
	belongs_to :tag
end
