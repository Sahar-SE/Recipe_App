require 'rails_helper'

RSpec.describe 'Public Recipes', type: :request do
  describe 'recipes#public' do
    before(:example) { get '/recipes/index' }

    it 'returns correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders correct template' do
      expect(response).to render_template(:public)
    end

    it 'returns correct response body' do
      expect(response.body).to include('Public Recipe List')
    end

    it 'returns correct response body' do
      expect(response.body).to include('RecipeOnRails')
    end
  end
end
