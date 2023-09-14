class Tag < ApplicationRecord
  belongs_to :user

  has_many :task_tags, dependent: :destroy
  has_many :tasks, -> { distinct }, through: :task_tags

  validates :title, presence: true
end
