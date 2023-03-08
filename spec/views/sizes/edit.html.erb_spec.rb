require 'rails_helper'

RSpec.describe 'sizes/edit', type: :view do
  let(:size) do
    Size.create!(
      number: 1.5
    )
  end

  before(:each) do
    assign(:size, size)
  end

  it 'renders the edit size form' do
    render

    assert_select 'form[action=?][method=?]', size_path(size), 'post' do
      assert_select 'input[name=?]', 'size[number]'
    end
  end
end
