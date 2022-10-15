require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :each do
    @user = User.create(name: 'John Doe', email: 'johndoe@gmail.com', password: 123_456, password_confirmation: 123_456)
    @user.skip_confirmation!
  end
  context 'validations' do
    it 'is valid with valid attributes' do
      recipe = Recipe.new(name: 'Apples', preparation_time: '1 hour', cooking_time: '30 minutes',
                          description: 'Lorem ipsum', public: false, user_id: @user.id)
      expect(recipe).to be_valid
    end

    it 'is not valid without a name' do
      recipe = Recipe.new(name: nil, preparation_time: '1 hour', cooking_time: '30 minutes',
                          description: 'Lorem ipsum', public: false, user_id: @user.id)
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a preparation_time' do
      recipe = Recipe.new(name: 'Apples', preparation_time: nil, cooking_time: '30 minutes',
                          description: 'Lorem ipsum', public: false, user_id: @user.id)
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a cooking_time' do
      recipe = Recipe.new(name: 'Apples', preparation_time: '1 hour', cooking_time: nil, description: 'Lorem ipsum',
                          public: false, user_id: @user.id)
      expect(recipe).to_not be_valid
    end

    it 'is not valid without a description' do
      recipe = Recipe.new(name: 'Apples', preparation_time: '1 hour', cooking_time: '30 minutes', description: nil,
                          public: false, user_id: @user.id)
      expect(recipe).to_not be_valid
    end
  end

  context 'associations' do
    it 'has_many recipes' do
      t = Recipe.reflect_on_association(:recipes_foods)
      expect(t.macro).to eq :has_many
    end
    it 'belongs_to user' do
      t = Recipe.reflect_on_association(:user)
      expect(t.macro).to eq :belongs_to
    end
  end
end
