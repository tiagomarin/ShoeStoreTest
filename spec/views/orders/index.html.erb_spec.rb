require 'rails_helper'

RSpec.describe 'orders/index', type: :view do
  before(:each) do
    assign(:orders, [
             Order.create!(
               total_price: '9.99',
               status: 'Status'
             ),
             Order.create!(
               total_price: '9.99',
               status: 'Status'
             )
           ])
  end

  it 'renders a list of orders' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('9.99'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new('Status'.to_s), count: 2
  end
end
