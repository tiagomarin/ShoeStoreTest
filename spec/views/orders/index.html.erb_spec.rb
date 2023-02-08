require 'rails_helper'

RSpec.describe 'orders/index', type: :view do
  before(:each) do
    assign(:orders, [
             Order.create!(
               status: 'Status'
             ),
             Order.create!(
               status: 'Status'
             )
           ])
  end

  it 'renders a list of orders' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Status'.to_s), count: 2
  end
end
