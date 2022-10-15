class Food < ApplicationRecord
  belongs_to :user
  has_many :recipes_foods, dependent: :destroy, class_name: 'RecipeFood'

  validates :name, presence: true, length: { in: 1..255 }
  validates :measurement_unit, presence: true, length: { in: 1..255 }
  validates :price, numericality: { decimal: true, greater_than: 0 }
  validates :quantity, numericality: { integer: true, greater_than: 0 }
end
