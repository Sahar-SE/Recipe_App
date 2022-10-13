class Food < ApplicationRecord
  belongs_to :users
  has_many :recipes_foods, dependent: :destroy

  validates :name, :price, :quantity, :measurement_unit, presence: true
end
