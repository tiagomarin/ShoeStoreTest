require 'rails_helper'

RSpec.describe "decorations/edit", type: :view do
  let(:decoration) {
    Decoration.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:decoration, decoration)
  end

  it "renders the edit decoration form" do
    render

    assert_select "form[action=?][method=?]", decoration_path(decoration), "post" do

      assert_select "input[name=?]", "decoration[name]"
    end
  end
end
