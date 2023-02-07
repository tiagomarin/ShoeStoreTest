require 'rails_helper'

RSpec.describe 'orders/show', type: :view do
  before(:each) do
    assign(:order, Order.create!(
                     total_price: '9.99',
                     status: 'Status'
                   ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Status/)
  end
end
