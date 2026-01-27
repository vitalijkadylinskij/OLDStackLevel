class CareersController < ApplicationController
  def index
    set_meta_tags(page_meta_tags('STACKLEVEL - Career').tags)
    @developers = Career.locale(I18n.locale)
  end
end
