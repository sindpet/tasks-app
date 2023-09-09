require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  context "associations" do
    it { should have_many(:projects).dependent(:destroy) }
    it { should have_many(:tags).dependent(:destroy) }
    it { should have_many(:tasks).dependent(:destroy) }
  end

  context "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  context "with too short password" do
    it "is invalid" do
      user.password = "a"
      user.password_confirmation = "a"
      expect(user).not_to be_valid
    end
  end

  context "with all required attributes" do
    it "saves to db" do
      expect(user.save).to eq(true)
    end
  end

  context "with invalid attribute" do
    it "doesn't save to db" do
      user.first_name = ""
      expect(user.save).to eq(false)
    end
  end
end
