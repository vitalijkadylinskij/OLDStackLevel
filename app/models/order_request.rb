class OrderRequest < ApplicationRecord
  validates :name, length: { maximum: 30 }
  validates :description, length: { maximum: 300 }
  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
