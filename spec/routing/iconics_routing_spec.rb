require 'rails_helper'

RSpec.describe IconicsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/iconics').to route_to('iconics#index')
    end

    it 'routes to #new' do
      expect(get: '/iconics/new').to route_to('iconics#new')
    end

    it 'routes to #show' do
      expect(get: '/iconics/1').to route_to('iconics#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/iconics/1/edit').to route_to('iconics#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/iconics').to route_to('iconics#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/iconics/1').to route_to('iconics#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/iconics/1').to route_to('iconics#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/iconics/1').to route_to('iconics#destroy', id: '1')
    end
  end
end
