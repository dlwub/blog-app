require 'rails_helper'

RSpec.describe 'api/comments/show', type: :view do
  before(:each) do
    assign(:api_comment, Api::Comment.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
