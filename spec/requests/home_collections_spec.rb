require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/home_collections', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # HomeCollection. As you add validations to HomeCollection, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      HomeCollection.create! valid_attributes
      get home_collections_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      home_collection = HomeCollection.create! valid_attributes
      get home_collection_url(home_collection)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_home_collection_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      home_collection = HomeCollection.create! valid_attributes
      get edit_home_collection_url(home_collection)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new HomeCollection' do
        expect do
          post home_collections_url, params: { home_collection: valid_attributes }
        end.to change(HomeCollection, :count).by(1)
      end

      it 'redirects to the created home_collection' do
        post home_collections_url, params: { home_collection: valid_attributes }
        expect(response).to redirect_to(home_collection_url(HomeCollection.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new HomeCollection' do
        expect do
          post home_collections_url, params: { home_collection: invalid_attributes }
        end.to change(HomeCollection, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post home_collections_url, params: { home_collection: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested home_collection' do
        home_collection = HomeCollection.create! valid_attributes
        patch home_collection_url(home_collection), params: { home_collection: new_attributes }
        home_collection.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the home_collection' do
        home_collection = HomeCollection.create! valid_attributes
        patch home_collection_url(home_collection), params: { home_collection: new_attributes }
        home_collection.reload
        expect(response).to redirect_to(home_collection_url(home_collection))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        home_collection = HomeCollection.create! valid_attributes
        patch home_collection_url(home_collection), params: { home_collection: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested home_collection' do
      home_collection = HomeCollection.create! valid_attributes
      expect do
        delete home_collection_url(home_collection)
      end.to change(HomeCollection, :count).by(-1)
    end

    it 'redirects to the home_collections list' do
      home_collection = HomeCollection.create! valid_attributes
      delete home_collection_url(home_collection)
      expect(response).to redirect_to(home_collections_url)
    end
  end
end
