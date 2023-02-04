require 'swagger_helper'

describe 'Posts API' do
  path 'api/users/{user_id}/posts' do
    get 'Retrieves all posts' do
      tags 'Posts'
      produces 'application/json'
      parameter id: :user_id, :in => :path, type: :integer

      response '200', 'posts found' do
        schema type: :object,
        properties: {
          id: {type: :integer},
          title: {type: :string},
          text: {type: :text},
          status: {type: :string}
        },
        required: ['id', 'title', 'text', 'status']
        let(:id) {Post.create(title: "First post", text: "My first post").id}
        run_test!
      end
  end
end