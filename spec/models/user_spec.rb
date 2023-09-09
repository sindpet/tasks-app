require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  context "with all required attributes" do
    it "is valid" do
      expect(user).to be_valid
    end

    it "saves to db" do
      expect(user.save).to eq(true)
    end
  end

  context "without first name" do
    it "is invalid" do
      user.first_name = ""
      expect(user).not_to be_valid
    end
  end

  context "without last name" do
    it "is invalid" do
      user.last_name = ""
      expect(user).not_to be_valid
    end
  end

  context "with too short password" do
    it "is invalid" do
      user.password = "a"
      user.password_confirmation = "a"
      expect(user).not_to be_valid
    end
  end

  context "invalid" do
    it "won't save to db" do
      user.first_name = ""
      expect(user.save).to eq(false)
    end
  end
end
