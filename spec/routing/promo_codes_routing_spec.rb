require 'rails_helper'

RSpec.describe PromoCodesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/promo_codes').to route_to('promo_codes#index')
    end

    it 'routes to #new' do
      expect(get: '/promo_codes/new').to route_to('promo_codes#new')
    end

    it 'routes to #show' do
      expect(get: '/promo_codes/1').to route_to('promo_codes#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/promo_codes/1/edit').to route_to('promo_codes#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/promo_codes').to route_to('promo_codes#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/promo_codes/1').to route_to('promo_codes#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/promo_codes/1').to route_to('promo_codes#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/promo_codes/1').to route_to('promo_codes#destroy', id: '1')
    end
  end
end
