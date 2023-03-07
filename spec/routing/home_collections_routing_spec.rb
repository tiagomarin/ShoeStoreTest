require 'rails_helper'

RSpec.describe HomeCollectionsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/home_collections').to route_to('home_collections#index')
    end

    it 'routes to #new' do
      expect(get: '/home_collections/new').to route_to('home_collections#new')
    end

    it 'routes to #show' do
      expect(get: '/home_collections/1').to route_to('home_collections#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/home_collections/1/edit').to route_to('home_collections#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/home_collections').to route_to('home_collections#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/home_collections/1').to route_to('home_collections#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/home_collections/1').to route_to('home_collections#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/home_collections/1').to route_to('home_collections#destroy', id: '1')
    end
  end
end
