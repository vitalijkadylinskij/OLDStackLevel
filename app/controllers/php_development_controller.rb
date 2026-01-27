class PhpDevelopmentController < ApplicationController
  def index
    set_meta_tags(page_meta_tags('Hire Experienced PHP Developers from STACKLEVEL GROUP').tags)
  end
end
