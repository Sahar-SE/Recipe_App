class Recipe < ApplicationRecord
  belongs_to :user

  has_many :recipes_foods, dependent: :destroy
end
