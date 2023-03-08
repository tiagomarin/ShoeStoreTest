require 'rails_helper'

RSpec.describe "home_categories/show", type: :view do
  before(:each) do
    assign(:home_category, HomeCategory.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
