require 'rails_helper'

RSpec.describe "api/pets/show", type: :view do
  before(:each) do
    assign(:api_pet, Api::Pet.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
