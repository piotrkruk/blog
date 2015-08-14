class TagArticle
  include Interactor

  delegate :tags, :article, to: :context

  def call
    if tags != nil
      tmp = tags.split(',')
      context.tags = tmp
    end
    delete_removed_tags
    create_new_tags
  end

  private
  
  def parse_tags
  end

  def delete_removed_tags
    article.articles_tags.includes(:tag).each do |articles_tag|
      next if tags.include?(articles_tag.tag.name)
      articles_tag.delete
    end
  end

  def create_new_tags
    tags.each do |tag_name|
      tag = Tag.find_by(name: tag_name)
      tag = Tag.create(name: tag_name) unless tag

      assign_tag(tag)
    end
  end

  def assign_tag(tag)
    unless article.tags.any? { |t| t.name == tag.name }
      article.articles_tags.create(tag: tag)
    end
  end
end
