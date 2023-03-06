require 'rails_helper'

RSpec.describe DecorationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/decorations').to route_to('decorations#index')
    end

    it 'routes to #new' do
      expect(get: '/decorations/new').to route_to('decorations#new')
    end

    it 'routes to #show' do
      expect(get: '/decorations/1').to route_to('decorations#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/decorations/1/edit').to route_to('decorations#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/decorations').to route_to('decorations#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/decorations/1').to route_to('decorations#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/decorations/1').to route_to('decorations#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/decorations/1').to route_to('decorations#destroy', id: '1')
    end
  end
end
