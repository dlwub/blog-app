require 'rails_helper'

RSpec.describe 'api/posts/index', type: :view do
  before(:each) do
    assign(:api_posts, [
             Api::Post.create!,
             Api::Post.create!
           ])
  end

  it 'renders a list of api/posts' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
