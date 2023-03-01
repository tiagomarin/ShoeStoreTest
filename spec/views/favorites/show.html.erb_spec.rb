require 'rails_helper'

RSpec.describe 'favorites/show', type: :view do
  before(:each) do
    assign(:favorite, Favorite.create!(
                        index: 'Index'
                      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Index/)
  end
end
