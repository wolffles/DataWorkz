require 'rails_helper'

RSpec.describe RegisteredApplication, type: :model do
  let(:my_user) { FactoryGirl.create(:user) }

  let(:my_app) { RegisteredApplication.create!(name: "name", url: "url.com", user: my_user) }

  describe "attributes" do
    it "has has a name, and url" do
      expect(my_app).to have_attributes(name: "name", url: "url.com" )
    end
  end
end
