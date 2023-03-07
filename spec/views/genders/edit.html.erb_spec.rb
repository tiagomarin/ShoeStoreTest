require 'rails_helper'

RSpec.describe 'genders/edit', type: :view do
  let(:gender) do
    Gender.create!(
      name: 'MyString'
    )
  end

  before(:each) do
    assign(:gender, gender)
  end

  it 'renders the edit gender form' do
    render

    assert_select 'form[action=?][method=?]', gender_path(gender), 'post' do
      assert_select 'input[name=?]', 'gender[name]'
    end
  end
end
