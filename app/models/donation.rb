class Donation < ApplicationRecord
  belongs_to :project
  belongs_to :donator
  validates :quantity_donated, presence: true
  validates :status, presence: true

end
