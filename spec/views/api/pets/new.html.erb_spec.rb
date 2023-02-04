require 'rails_helper'

RSpec.describe "api/pets/new", type: :view do
  before(:each) do
    assign(:api_pet, Api::Pet.new())
  end

  it "renders new api_pet form" do
    render

    assert_select "form[action=?][method=?]", api_pets_path, "post" do
    end
  end
end
