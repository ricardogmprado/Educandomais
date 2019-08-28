class Project < ApplicationRecord
  belongs_to :teacher
  has_many :donations
  has_many :donators, through: :donations
  validates :title, presence: true
  validates :description, presence: true
  validates :material, presence: true
  validates :quantity, presence: true
  validates :average_unit_price, presence: true
  validates :category, presence: true
  validates :limit_date, presence: true
end
