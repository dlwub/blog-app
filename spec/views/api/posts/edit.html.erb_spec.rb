require 'rails_helper'

RSpec.describe "api/posts/edit", type: :view do
  let(:api_post) {
    Api::Post.create!()
  }

  before(:each) do
    assign(:api_post, api_post)
  end

  it "renders the edit api_post form" do
    render

    assert_select "form[action=?][method=?]", api_post_path(api_post), "post" do
    end
  end
end
