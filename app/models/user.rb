class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :name, presence: true

  belongs_to :family
  has_many :pets, through: :families
  has_many :meals, through: :pets
  has_many :medicines, through: :pets
  has_many :appointments, through: :pets
  # add (1) attached photo
end
