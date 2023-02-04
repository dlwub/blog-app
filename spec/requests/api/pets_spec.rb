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

RSpec.describe '/api/pets', type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Api::Pet. As you add validations to Api::Pet, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Api::Pet.create! valid_attributes
      get api_pets_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      pet = Api::Pet.create! valid_attributes
      get api_pet_url(pet)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_api_pet_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      pet = Api::Pet.create! valid_attributes
      get edit_api_pet_url(pet)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Api::Pet' do
        expect do
          post api_pets_url, params: { api_pet: valid_attributes }
        end.to change(Api::Pet, :count).by(1)
      end

      it 'redirects to the created api_pet' do
        post api_pets_url, params: { api_pet: valid_attributes }
        expect(response).to redirect_to(api_pet_url(Api::Pet.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Api::Pet' do
        expect do
          post api_pets_url, params: { api_pet: invalid_attributes }
        end.to change(Api::Pet, :count).by(0)
      end


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post api_pets_url, params: { api_pet: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested api_pet' do
        pet = Api::Pet.create! valid_attributes
        patch api_pet_url(pet), params: { api_pet: new_attributes }
        pet.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the api_pet' do
        pet = Api::Pet.create! valid_attributes
        patch api_pet_url(pet), params: { api_pet: new_attributes }
        pet.reload
        expect(response).to redirect_to(api_pet_url(pet))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        pet = Api::Pet.create! valid_attributes
        patch api_pet_url(pet), params: { api_pet: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested api_pet' do
      pet = Api::Pet.create! valid_attributes
      expect do
        delete api_pet_url(pet)
      end.to change(Api::Pet, :count).by(-1)
    end

    it 'redirects to the api_pets list' do
      pet = Api::Pet.create! valid_attributes
      delete api_pet_url(pet)
      expect(response).to redirect_to(api_pets_url)
    end
  end
end