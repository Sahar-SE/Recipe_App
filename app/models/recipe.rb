class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods, dependent: :destroy, class_name: 'RecipeFood'

  validates :name, :preparation_time, :cooking_time, :description, presence: true
end
