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

RSpec.describe '/home_categories', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # HomeCategory. As you add validations to HomeCategory, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      HomeCategory.create! valid_attributes
      get home_categories_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      home_category = HomeCategory.create! valid_attributes
      get home_category_url(home_category)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_home_category_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      home_category = HomeCategory.create! valid_attributes
      get edit_home_category_url(home_category)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new HomeCategory' do
        expect do
          post home_categories_url, params: { home_category: valid_attributes }
        end.to change(HomeCategory, :count).by(1)
      end

      it 'redirects to the created home_category' do
        post home_categories_url, params: { home_category: valid_attributes }
        expect(response).to redirect_to(home_category_url(HomeCategory.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new HomeCategory' do
        expect do
          post home_categories_url, params: { home_category: invalid_attributes }
        end.to change(HomeCategory, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post home_categories_url, params: { home_category: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested home_category' do
        home_category = HomeCategory.create! valid_attributes
        patch home_category_url(home_category), params: { home_category: new_attributes }
        home_category.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the home_category' do
        home_category = HomeCategory.create! valid_attributes
        patch home_category_url(home_category), params: { home_category: new_attributes }
        home_category.reload
        expect(response).to redirect_to(home_category_url(home_category))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        home_category = HomeCategory.create! valid_attributes
        patch home_category_url(home_category), params: { home_category: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested home_category' do
      home_category = HomeCategory.create! valid_attributes
      expect do
        delete home_category_url(home_category)
      end.to change(HomeCategory, :count).by(-1)
    end

    it 'redirects to the home_categories list' do
      home_category = HomeCategory.create! valid_attributes
      delete home_category_url(home_category)
      expect(response).to redirect_to(home_categories_url)
    end
  end
end
