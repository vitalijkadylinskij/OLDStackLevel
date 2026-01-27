class HireDeveloper < ApplicationRecord
  has_and_belongs_to_many :technologies
  has_and_belongs_to_many :frameworks
  has_and_belongs_to_many :business_domains
  
  has_and_belongs_to_many :case_studies
  
  scope :locale, -> (locale) { where locale: locale }  
end
