module ApplicationHelper
	def avatar_url(user)
		gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
		"http://gravatar.com/avatar/#{gravatar_id}.png"
	end

  def tag_cloud
    Article.tag_counts.limit(60).sort_by(&:count).reverse
  end
end
