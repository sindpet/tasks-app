require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { build(:task) }

  context "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:project).optional }
    it { should have_one_attached(:file) }
    it { should have_many(:tags).through(:task_tags) }
  end

  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_inclusion_of(:is_done).in_array([true, false]) }
  end

  context "with user" do
    let(:user) { create(:user) }

    it "saves to db without a project" do
      task.user = user
      expect(task.save).to eq(true)
    end

    it "saves to db with project" do
      task.user = user
      task.project = create(:project, user: user)
      expect(task.save).to eq(true)
    end
  end

end
