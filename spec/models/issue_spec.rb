require 'spec_helper'

RSpec.describe Issue, type: :model do
  context "validation" do
    it "should pass" do
      expect(FactoryBot.build(:issue)).to be_valid
    end
  end
end