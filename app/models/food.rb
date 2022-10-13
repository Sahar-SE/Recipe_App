class Food < ApplicationRecord
  belongs_to :users
  has_many :receipFoods
end
