class AboutUsController < ApplicationController

    def index
        set_meta_tags(page_meta_tags('STACKLEVEL - About Us').tags)
    end
end