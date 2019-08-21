class Project < ApplicationRecord
  belongs_to :teacher
  validates :title, presence: true
  validates :description, presence: true
  validates :material, presence: true
  validates :quantity, presence: true
  validates :average_unit_price, presence: true
  validates :category, presence: true
  validates :limit_date, presence: true
end
