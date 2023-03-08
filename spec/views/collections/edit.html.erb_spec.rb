require 'rails_helper'

RSpec.describe 'collections/edit', type: :view do
  let(:collection) do
    Collection.create!(
      name: 'MyString'
    )
  end

  before(:each) do
    assign(:collection, collection)
  end

  it 'renders the edit collection form' do
    render

    assert_select 'form[action=?][method=?]', collection_path(collection), 'post' do
      assert_select 'input[name=?]', 'collection[name]'
    end
  end
end
