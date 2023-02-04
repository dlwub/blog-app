require 'swagger_helper'

describe 'Comments API' do
  path '/api/comments' do
    post 'Creates a post' do
      tags 'Posts'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          text: { type: :text },
          author_id: { type: :integer },
          post_id: { type: :integer }
        },
        required: %w[title text]
      }
      response '201', 'comment created' do
        let(:comment) { { title: 'First comment', text: 'Good view!' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { title: 'First comment' } }
        run_test!
      end
    end
  end
end
