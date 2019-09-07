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

  def completed_project(quantity, total_donations)
    if total_donations > quantity
      status = "Finalizado"
    end
  end

  def total_donations
    sum = 0
    donations.each do |donation|
      sum += donation.quantity_donated
    end
    sum
  end
end
