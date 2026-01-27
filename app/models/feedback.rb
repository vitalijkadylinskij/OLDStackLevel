class Feedback < ApplicationRecord
    mount_uploader :author_photo, FeedbackImageUploader

    scope :locale, -> (locale) { where locale: locale }  
end
