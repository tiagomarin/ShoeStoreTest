require 'rails_helper'

RSpec.describe 'sizes/show', type: :view do
  before(:each) do
    assign(:size, Size.create!(
                    number: 2.5
                  ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2.5/)
  end
end
