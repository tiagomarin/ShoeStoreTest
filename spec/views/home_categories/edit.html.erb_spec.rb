require 'rails_helper'

RSpec.describe "home_categories/edit", type: :view do
  let(:home_category) {
    HomeCategory.create!()
  }

  before(:each) do
    assign(:home_category, home_category)
  end

  it "renders the edit home_category form" do
    render

    assert_select "form[action=?][method=?]", home_category_path(home_category), "post" do
    end
  end
end
