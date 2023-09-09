class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :tasks, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
end
