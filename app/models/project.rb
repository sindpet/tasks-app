class Project < ApplicationRecord
  belongs_to :user

  has_many :tasks, dependent: :destroy

  validates :title, presence: true
  validates :position, presence: true #, inclusion: { in: 1.. }
end
