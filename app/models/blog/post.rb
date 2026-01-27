class Blog::Post < ActiveRecord::Base
  mount_uploader :preview_image, ImageUploader

  validates :slug, presence: true, uniqueness: true
  validates :title, length: { maximum: 100 }

  def self.published
    where('published_at < ?', Time.zone.now).order(published_at: :desc)
  end

  def to_param
    slug
  end

  def published_on
    published_at.to_date
  end

  def is_published?
    published_at.present? ? published_on : 'nope'
  end
end
