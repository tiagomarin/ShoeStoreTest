require 'rails_helper'

RSpec.describe 'Collaborators', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/collaborators/index'
      expect(response).to have_http_status(:success)
    end
  end
end
