require 'rails_helper'

RSpec.describe "paintings/edit", :type => :view do
  before(:each) do
    @painting = assign(:painting, Painting.create!())
  end

  it "renders the edit painting form" do
    render

    assert_select "form[action=?][method=?]", painting_path(@painting), "post" do
    end
  end
end
