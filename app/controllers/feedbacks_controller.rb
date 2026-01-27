class FeedbacksController < ApplicationController
  
    def index
      @feedbacks = Feedback.locale(I18n.locale)
    end
  
  end
  