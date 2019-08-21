class School < ApplicationRecord
  has_many :teachers
  has_many :projects, through: :teacher
  validates :address, presence: true
  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true
end
