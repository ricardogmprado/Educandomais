class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :school
  has_many :projects, dependent: :destroy
  has_many :donation, through: :projetos
  validates :name, presence: true
  validates :last_name, presence: true
  validates :registration_code, presence: true
  validates :course, presence: true
  validates :telephone, presence: true
end
