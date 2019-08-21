class Payment < ApplicationRecord
  belongs_to :donator
  validates :status, presence: true
  validates :date, presence: true
  validates :value, presence: true
  validates :duration, presence: true
end
