class Ingredient < ApplicationRecord
    validates_uniqueness_of :name, presence: true
end
