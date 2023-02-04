require 'rails_helper'

RSpec.describe "api/pets/edit", type: :view do
  let(:api_pet) {
    Api::Pet.create!()
  }

  before(:each) do
    assign(:api_pet, api_pet)
  end

  it "renders the edit api_pet form" do
    render

    assert_select "form[action=?][method=?]", api_pet_path(api_pet), "post" do
    end
  end
end
