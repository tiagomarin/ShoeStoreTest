require 'rails_helper'

RSpec.describe 'orders/new', type: :view do
  before(:each) do
    assign(:order, Order.new(
                     total_price: '9.99',
                     status: 'MyString'
                   ))
  end

  it 'renders new order form' do
    render

    assert_select 'form[action=?][method=?]', orders_path, 'post' do
      assert_select 'input[name=?]', 'order[total_price]'

      assert_select 'input[name=?]', 'order[status]'
    end
  end
end
