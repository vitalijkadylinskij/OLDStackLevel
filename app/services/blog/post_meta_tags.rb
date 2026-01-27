class Blog::PostMetaTags
  attr_reader :post, :controller

  def initialize(post, controller)
    @post = post
    @controller = controller
  end

  def tags
    {
      title: post.title,
      description: meta_information.description,
      keywords: meta_information.keywords,
      twitter: twitter_tags,
      og: og_tags
    }
  end

  private

  def twitter_tags
    {
      card: 'summary_large_image',
      site: Rails.application.secrets.twitter_username,
      title: title,
      description: meta_information.description,
      image: image_url
    }
  end

  def og_tags
    {
      url: post_url,
      type: 'article',
      title: title,
      description: meta_information.description,
      image: image_url
    }
  end

  def title
    meta_information.custom_title || post.title
  end

  def image_url
    "#{base_url}#{meta_information.cover_image.social_networks.url}"
  end

  def base_url
    controller.request.base_url
  end

  def post_url
    controller.blog_post_url(post)
  end

  def meta_information
    post.meta_information
  end
end
