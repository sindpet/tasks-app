require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:tag) { build(:tag) }

  context "associations" do
    it { should belong_to(:user) }
    it { should have_many(:tasks).through(:task_tags) }
  end

  context "validations" do
    it { should validate_presence_of(:title) }
  end

  context "without user" do
    it "doesn't save to db" do
      expect(tag.save).to eq(false)
    end
  end

  context "with user" do
    it "saves to db" do
      tag.user = create(:user)
      expect(tag.save).to eq(true)
    end
  end
end
