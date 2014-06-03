require 'rails_helper'

RSpec.describe "paintings/index", :type => :view do
  before(:each) do
    assign(:paintings, [
      Painting.create!(),
      Painting.create!()
    ])
  end

  it "renders a list of paintings" do
    render
  end
end
