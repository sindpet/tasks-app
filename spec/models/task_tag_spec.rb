require 'rails_helper'

RSpec.describe TaskTag, type: :model do
  let(:task_tag) { build(:task_tag) }

  context "associations" do
    it { should belong_to(:task) }
    it { should belong_to(:tag) }
  end

  context "without task and/or tag" do
    it "doesn't save to db" do
      expect(task_tag.save).to eq(false)
    end
  end

  context "with task and tag" do
    it "saves to db" do
      user = create(:user)
      task_tag.task = create(:task, user: user)
      task_tag.tag = create(:tag, user: user)
      expect(task_tag.save).to eq(true)
    end
  end
end
