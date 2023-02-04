require 'rails_helper'

RSpec.describe "api/comments/index", type: :view do
  before(:each) do
    assign(:api_comments, [
      Api::Comment.create!(),
      Api::Comment.create!()
    ])
  end

  it "renders a list of api/comments" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
