require 'rails_helper'

RSpec.describe 'promo_codes/new', type: :view do
  before(:each) do
    assign(:promo_code, PromoCode.new(
                          title: 'MyString',
                          value: 1.5
                        ))
  end

  it 'renders new promo_code form' do
    render

    assert_select 'form[action=?][method=?]', promo_codes_path, 'post' do
      assert_select 'input[name=?]', 'promo_code[title]'

      assert_select 'input[name=?]', 'promo_code[value]'
    end
  end
end
