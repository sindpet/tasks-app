class Task < ApplicationRecord
  belongs_to :user
  belongs_to :project, optional: true

  has_one_attached :file, dependent: :destroy

  has_many :task_tags, dependent: :destroy
  has_many :tags, through: :task_tags

  validates :title, presence: true
  validates :is_done, inclusion: [true, false]

  default_scope { order(is_done: :asc) }
  scope :finished, -> { where(is_done: true) }
  scope :unfinished, -> { where(is_done: false) }
end
