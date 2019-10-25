class Donation < ApplicationRecord
  belongs_to :project
  belongs_to :donator
  validates :quantity_donated, presence: true
  validates :status, presence: true

  after_update :check_status

  def check_status
    if self.status == "doação recebida"
      project = self.project
      project.total_donations += self.quantity_donated
      project.save
    end
  end

end
