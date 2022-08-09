class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :username, presence: true
  # validates :name, presence: true


  belongs_to :ownership
  has_many :pets, through: :ownerships
  has_many :meals, through: :pets
  has_many :medicines, through: :pets
  has_many :appointments, through: :pets

  has_one_attached :photo
end
