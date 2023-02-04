require 'rails_helper'

RSpec.describe 'api/comments/new', type: :view do
  before(:each) do
    assign(:api_comment, Api::Comment.new)
  end

  it 'renders new api_comment form' do
    render

    assert_select 'form[action=?][method=?]', api_comments_path, 'post' do
    end
  end
end
