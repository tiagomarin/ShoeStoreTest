require 'rails_helper'

RSpec.describe 'colors/new', type: :view do
  before(:each) do
    assign(:color, Color.new(
                     name: 'MyString'
                   ))
  end

  it 'renders new color form' do
    render

    assert_select 'form[action=?][method=?]', colors_path, 'post' do
      assert_select 'input[name=?]', 'color[name]'
    end
  end
end
