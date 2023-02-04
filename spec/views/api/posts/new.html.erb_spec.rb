require 'rails_helper'

RSpec.describe "api/posts/new", type: :view do
  before(:each) do
    assign(:api_post, Api::Post.new())
  end

  it "renders new api_post form" do
    render

    assert_select "form[action=?][method=?]", api_posts_path, "post" do
    end
  end
end
