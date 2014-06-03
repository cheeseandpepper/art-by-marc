require 'rails_helper'

RSpec.describe "paintings/new", :type => :view do
  before(:each) do
    assign(:painting, Painting.new())
  end

  it "renders new painting form" do
    render

    assert_select "form[action=?][method=?]", paintings_path, "post" do
    end
  end
end
