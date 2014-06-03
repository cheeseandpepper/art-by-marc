require 'rails_helper'

RSpec.describe "Paintings", :type => :request do
  describe "GET /paintings" do
    it "works! (now write some real specs)" do
      get paintings_path
      expect(response.status).to be(200)
    end
  end
end
