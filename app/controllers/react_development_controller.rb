class ReactDevelopmentController < ApplicationController
  def index
    set_meta_tags(page_meta_tags('Hire Experienced React Developers from STACKLEVEL GROUP').tags)
  end
end
