class Development < ApplicationRecord
  scope :locale, -> (locale) { where locale: locale }
end
