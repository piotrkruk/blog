class ArticlesTag < ActiveRecord::Base
  self.primary_key = :article_id, :tag_id
  
  belongs_to :articles
  belongs_to :tag
end
