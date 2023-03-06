require 'rails_helper'

RSpec.describe "genders/show", type: :view do
  before(:each) do
    assign(:gender, Gender.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
