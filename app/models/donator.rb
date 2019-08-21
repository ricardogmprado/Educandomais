class Donator < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :donations
  has_many :payments
  validates :name, presence: true
  validates :last_name, presence: true
  validates :cpf, presence: true
  validates :telephone, presence: true
end
