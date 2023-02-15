require 'rails_helper'

RSpec.describe 'promo_codes/index', type: :view do
  before(:each) do
    assign(:promo_codes, [
             PromoCode.create!(
               title: 'Title',
               value: 2.5
             ),
             PromoCode.create!(
               title: 'Title',
               value: 2.5
             )
           ])
  end

  it 'renders a list of promo_codes' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Title'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
  end
end
