class BusinessDomain < ApplicationRecord
    has_and_belongs_to_many :hire_developers
    has_and_belongs_to_many :case_studies
end
