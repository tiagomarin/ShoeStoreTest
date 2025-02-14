require 'rails_helper'

RSpec.describe 'sizes/index', type: :view do
  before(:each) do
    assign(:sizes, [
             Size.create!(
               number: 2.5
             ),
             Size.create!(
               number: 2.5
             )
           ])
  end

  it 'renders a list of sizes' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(2.5.to_s), count: 2
  end
end
