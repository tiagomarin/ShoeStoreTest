require 'rails_helper'

RSpec.describe 'colors/edit', type: :view do
  let(:color) do
    Color.create!(
      name: 'MyString'
    )
  end

  before(:each) do
    assign(:color, color)
  end

  it 'renders the edit color form' do
    render

    assert_select 'form[action=?][method=?]', color_path(color), 'post' do
      assert_select 'input[name=?]', 'color[name]'
    end
  end
end
