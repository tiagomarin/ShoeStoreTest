require 'rails_helper'

RSpec.describe "colors/show", type: :view do
  before(:each) do
    assign(:color, Color.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
