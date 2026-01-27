# app/services/pages/meta_tags.rb

module Pages
  class MetaTags
    attr_reader :title, :description, :keywords, :controller

    def initialize(meta_information, controller)
      @title = meta_information.title || default_title
      @description = meta_information.description
      @keywords = meta_information.keywords
      @controller = controller
    end

    def tags
      {
        title: title,
        description: description,
        robots: "noindex, follow",
        keywords: keywords,
        og: open_graph_tags,
        twitter: twitter_cards_tags
      }
    end

    private

    def default_title
      "STACKLEVEL – Professional React.js, PHP, Ruby on Rails Development"
    end

    def twitter_cards_tags
      {
        card: "summary_large_image",
        site: Rails.application.secrets.twitter_username,
        creator: Rails.application.secrets.twitter_username,
        title: title,
        description: description,
        image: image_url,
        url: base_url
      }
    end

    def open_graph_tags
      {
        type: "website",
        title: title,
        description: description,
        url: base_url,
        site_name: "STACKLEVEL",
        image: image_url,
        "image:secure_url": image_url,
        "image:width": 1200,
        "image:height": 630
      }
    end

    def image_url
      "#{base_url}/_small_logo.png"
    end

    def base_url
      controller.request.base_url
    end
  end
end
