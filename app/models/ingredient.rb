class Ingredient < ApplicationRecord
  has_many :ideas
  has_many :recipes, through: :ideas
end
