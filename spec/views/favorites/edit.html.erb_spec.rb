require 'rails_helper'

RSpec.describe 'favorites/edit', type: :view do
  let(:favorite) do
    Favorite.create!(
      index: 'MyString'
    )
  end

  before(:each) do
    assign(:favorite, favorite)
  end

  it 'renders the edit favorite form' do
    render

    assert_select 'form[action=?][method=?]', favorite_path(favorite), 'post' do
      assert_select 'input[name=?]', 'favorite[index]'
    end
  end
end
