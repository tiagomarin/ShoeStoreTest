require 'rails_helper'

RSpec.describe 'decorations/show', type: :view do
  before(:each) do
    assign(:decoration, Decoration.create!(
                          name: 'Name'
                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
