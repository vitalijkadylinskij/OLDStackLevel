class CaseStudy < ApplicationRecord
  has_and_belongs_to_many :technologies
  has_and_belongs_to_many :business_domains
  
  has_and_belongs_to_many :hire_developers

  mount_uploader :project_bg, CaseStudyImageUploader
  mount_uploaders :screenshots, CaseStudyScreenshotsUploader

  scope :locale, -> (locale) { where locale: locale }
end
