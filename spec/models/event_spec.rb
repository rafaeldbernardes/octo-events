require 'spec_helper'

RSpec.describe Event, type: :model do
  before(:each) do
    @issue = FactoryBot.create(:issue)
  end

  context "associations" do
    it { should belong_to(:issue) }
  end

  context "validation" do
    it "should invalidate when the action is not present" do
      expect(FactoryBot.build(:event, action: nil)).to be_invalid
    end

    it "should invalidate when the action is blank" do
      expect(FactoryBot.build(:event, action: "")).to be_invalid
    end

    it "should fail if issue is not present" do
      expect(FactoryBot.build(:event, issue: nil)).to be_invalid
    end

    it "should fail if issue is blank" do
      expect(FactoryBot.build(:event, issue_id: "")).to be_invalid
    end

    it "should pass" do
      expect(FactoryBot.build(:event, issue: @issue, action: 'update')).to be_valid
    end
  end
end