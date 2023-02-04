require 'rails_helper'

RSpec.describe 'api/posts/show', type: :view do
  before(:each) do
    assign(:api_post, Api::Post.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
