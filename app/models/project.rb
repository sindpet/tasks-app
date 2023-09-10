class Project < ApplicationRecord
  belongs_to :user

  has_many :tasks, dependent: :destroy

  validates :title, presence: true
  validates :position, presence: true #, inclusion: { in: 1.. }

  default_scope { order(position: :asc) }
end
