class HireDevelopersController < ApplicationController

    def index
      set_meta_tags(page_meta_tags('STACKLEVEL - Hire Developers').tags)
      @q = HireDeveloper.locale(I18n.locale).ransack(params[:q])
      @hire_developers = @q.result.includes(:technologies)

      @developments = ['React','PHP']
      @url = request.original_url

      @developments.each do |i|
        if @url.include? i
          @development = i
        end
      end
    end
    
  end
  