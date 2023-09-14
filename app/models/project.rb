class Project < ApplicationRecord
  belongs_to :user

  has_many :tasks, dependent: :destroy

  validates :title, presence: true
  validates :position, presence: true
  validates :position, numericality: { only_integer: true, greater_than: 0 }

  default_scope { order(position: :asc) }
end
