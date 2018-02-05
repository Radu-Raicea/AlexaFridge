class Recipe < ApplicationRecord
  has_many :ideas
  has_many :ingredients, through: :ideas
end
