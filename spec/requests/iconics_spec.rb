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

RSpec.describe '/iconics', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Iconic. As you add validations to Iconic, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Iconic.create! valid_attributes
      get iconics_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      iconic = Iconic.create! valid_attributes
      get iconic_url(iconic)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_iconic_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      iconic = Iconic.create! valid_attributes
      get edit_iconic_url(iconic)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Iconic' do
        expect do
          post iconics_url, params: { iconic: valid_attributes }
        end.to change(Iconic, :count).by(1)
      end

      it 'redirects to the created iconic' do
        post iconics_url, params: { iconic: valid_attributes }
        expect(response).to redirect_to(iconic_url(Iconic.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Iconic' do
        expect do
          post iconics_url, params: { iconic: invalid_attributes }
        end.to change(Iconic, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post iconics_url, params: { iconic: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested iconic' do
        iconic = Iconic.create! valid_attributes
        patch iconic_url(iconic), params: { iconic: new_attributes }
        iconic.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the iconic' do
        iconic = Iconic.create! valid_attributes
        patch iconic_url(iconic), params: { iconic: new_attributes }
        iconic.reload
        expect(response).to redirect_to(iconic_url(iconic))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        iconic = Iconic.create! valid_attributes
        patch iconic_url(iconic), params: { iconic: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested iconic' do
      iconic = Iconic.create! valid_attributes
      expect do
        delete iconic_url(iconic)
      end.to change(Iconic, :count).by(-1)
    end

    it 'redirects to the iconics list' do
      iconic = Iconic.create! valid_attributes
      delete iconic_url(iconic)
      expect(response).to redirect_to(iconics_url)
    end
  end
end
