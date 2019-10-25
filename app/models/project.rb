class Project < ApplicationRecord
  belongs_to :teacher
  has_many :project_photos, dependent: :destroy
  has_many :donations
  has_many :donators, through: :donations
  validates :title, presence: true
  validates :description, presence: true
  validates :material, presence: true
  validates :quantity, presence: true
  validates :average_unit_price, presence: true
  validates :category, presence: true
  validates :limit_date, presence: true

  accepts_nested_attributes_for :project_photos

  after_update :complete_project

  def complete_project
    self.status = "Finalizado" if self.total_donations >= self.quantity
    self.save if self.status_changed?
  end

end
