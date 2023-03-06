require 'rails_helper'

RSpec.describe 'sizes/new', type: :view do
  before(:each) do
    assign(:size, Size.new(
                    number: 1.5
                  ))
  end

  it 'renders new size form' do
    render

    assert_select 'form[action=?][method=?]', sizes_path, 'post' do
      assert_select 'input[name=?]', 'size[number]'
    end
  end
end
