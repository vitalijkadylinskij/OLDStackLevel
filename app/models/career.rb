class Career < ApplicationRecord
  has_and_belongs_to_many :technologies
  has_and_belongs_to_many :frameworks

  scope :locale, -> (locale) { where locale: locale }
end
