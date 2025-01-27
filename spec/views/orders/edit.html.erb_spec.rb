require 'rails_helper'

RSpec.describe 'orders/edit', type: :view do
  let(:order) do
    Order.create!(
      status: 'MyString'
    )
  end

  before(:each) do
    assign(:order, order)
  end

  it 'renders the edit order form' do
    render

    assert_select 'form[action=?][method=?]', order_path(order), 'post' do
      assert_select 'input[name=?]', 'order[status]'
    end
  end
end
