require 'rails_helper'

RSpec.describe 'promo_codes/edit', type: :view do
  let(:promo_code) do
    PromoCode.create!(
      title: 'MyString',
      value: 1.5
    )
  end

  before(:each) do
    assign(:promo_code, promo_code)
  end

  it 'renders the edit promo_code form' do
    render

    assert_select 'form[action=?][method=?]', promo_code_path(promo_code), 'post' do
      assert_select 'input[name=?]', 'promo_code[title]'

      assert_select 'input[name=?]', 'promo_code[value]'
    end
  end
end
