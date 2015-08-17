module TagsHelper
  def tag_counts
    Tag.select("tags.*, count(articles_tags.tag_id) as count").
    joins(:articles_tags).group("articles_tags.tag_id")
  end

  def tag_cloud
    tag_counts.limit(60).sort_by(&:count).reverse
  end
end
