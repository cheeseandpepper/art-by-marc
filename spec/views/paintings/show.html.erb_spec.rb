require 'rails_helper'

RSpec.describe "paintings/show", :type => :view do
  before(:each) do
    @painting = assign(:painting, Painting.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
