require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'Posts controller' do
    it 'is a success' do
      get '/users/1/posts'
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      get '/users/1/posts'
      expect(response).to render_template('index')
      expect(response.body).to include('List of all posts by')
    end

    it 'is a success' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:ok)
    end

    it "renders 'show' template" do
      get '/users/1/posts/1'
      expect(response).to render_template('show')
      expect(response.body).to include('Post')
    end
  end
end
