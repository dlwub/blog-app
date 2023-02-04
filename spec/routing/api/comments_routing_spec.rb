require 'rails_helper'

RSpec.describe Api::CommentsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/comments').to route_to('api/comments#index')
    end

    it 'routes to #new' do
      expect(get: '/api/comments/new').to route_to('api/comments#new')
    end

    it 'routes to #show' do
      expect(get: '/api/comments/1').to route_to('api/comments#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/api/comments/1/edit').to route_to('api/comments#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/comments').to route_to('api/comments#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/comments/1').to route_to('api/comments#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/comments/1').to route_to('api/comments#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/comments/1').to route_to('api/comments#destroy', id: '1')
    end
  end
end
