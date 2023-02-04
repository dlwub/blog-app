require 'rails_helper'

RSpec.describe "api/comments/edit", type: :view do
  let(:api_comment) {
    Api::Comment.create!()
  }

  before(:each) do
    assign(:api_comment, api_comment)
  end

  it "renders the edit api_comment form" do
    render

    assert_select "form[action=?][method=?]", api_comment_path(api_comment), "post" do
    end
  end
end
