class Blog::Author < ActiveRecord::Base
  has_many :authorships
  has_many :posts, through: :authorships
end
