require 'rails_helper'

RSpec.describe "home_categories/index", type: :view do
  before(:each) do
    assign(:home_categories, [
      HomeCategory.create!(),
      HomeCategory.create!()
    ])
  end

  it "renders a list of home_categories" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
