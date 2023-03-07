require 'rails_helper'

RSpec.describe 'home_collections/show', type: :view do
  before(:each) do
    assign(:home_collection, HomeCollection.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
