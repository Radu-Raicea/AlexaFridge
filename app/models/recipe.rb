class Recipe < ApplicationRecord
  has_many :ideas, dependent: :delete_all
  has_many :ingredients, through: :ideas
end
