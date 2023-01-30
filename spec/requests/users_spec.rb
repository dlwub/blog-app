require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Users index' do
    before(:example) { get users_path } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
      expect(response.body).to include('List of all users')
    end

    it 'is a success' do
      get '/users/1'
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      get '/users/1'
      expect(response).to render_template('show')
      expect(response.body).to include('Tom')
    end
  end
end
