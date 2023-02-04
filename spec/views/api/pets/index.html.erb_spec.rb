require 'rails_helper'

RSpec.describe "api/pets/index", type: :view do
  before(:each) do
    assign(:api_pets, [
      Api::Pet.create!(),
      Api::Pet.create!()
    ])
  end

  it "renders a list of api/pets" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
