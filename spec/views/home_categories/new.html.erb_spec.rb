require 'rails_helper'

RSpec.describe "home_categories/new", type: :view do
  before(:each) do
    assign(:home_category, HomeCategory.new())
  end

  it "renders new home_category form" do
    render

    assert_select "form[action=?][method=?]", home_categories_path, "post" do
    end
  end
end
