require 'rails_helper'

RSpec.describe 'collections/index', type: :view do
  before(:each) do
    assign(:collections, [
             Collection.create!(
               name: 'Name'
             ),
             Collection.create!(
               name: 'Name'
             )
           ])
  end

  it 'renders a list of collections' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Name'.to_s), count: 2
  end
end
