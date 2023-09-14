require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { build(:project) }

  context "associations" do
    it { should belong_to(:user) }
    it { should have_many(:tasks).dependent(:destroy) }
  end

  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:position) }
    it { should validate_numericality_of(:position) }
  end

  context "without user" do
    it "doesn't save to db" do
      project.user = nil
      expect(project.save).to eq(false)
    end
  end

  context "with user" do
    it "saves to db" do
      user = create(:user)
      project.user = user
      expect(project.save).to eq(true)
    end
  end

  context "default scope" do
    let(:user) { create(:user) }

    it "sorts by position ascending" do
      project_with_higher_position = create(:project, user: user, position: 10)
      project_with_lower_position = create(:project, user: user, position: 1)

      expect(Project.all.first).to eq(project_with_lower_position)
      expect(Project.all.last).to eq(project_with_higher_position)
    end
  end
end
