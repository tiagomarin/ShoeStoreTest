require 'rails_helper'

RSpec.describe 'promo_codes/show', type: :view do
  before(:each) do
    assign(:promo_code, PromoCode.create!(
                          title: 'Title',
                          value: 2.5
                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/2.5/)
  end
end
