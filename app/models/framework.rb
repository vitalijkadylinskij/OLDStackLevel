class Framework < ApplicationRecord
    has_and_belongs_to_many :hire_developers
    has_and_belongs_to_many :career
end
