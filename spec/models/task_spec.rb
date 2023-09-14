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

  context "scopes" do
    let!(:user) { create(:user) }
    let!(:unfinished_task) { create(:task, user: user, is_done: false) }
    let!(:finished_task) { create(:task, user: user, is_done: true) }

    it "sorts by is_done ascending (false first)" do
      expect(Task.all.first).to eq(unfinished_task)
      expect(Task.all.last).to eq(finished_task)
    end

    it "shows only finished task in #finished scope" do
      expect(Task.finished.first).to eq(finished_task)
      expect(Task.finished.count).to eq(1)
    end

    it "shows only unfinished task in #unfinished scope" do
      expect(Task.unfinished.first).to eq(unfinished_task)
      expect(Task.unfinished.count).to eq(1)
    end
  end
end
