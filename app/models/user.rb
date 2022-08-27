class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :name, presence: true

  has_many :ownerships

  has_many :pets, through: :ownerships
  has_many :meals, through: :pets
  has_many :medicines, through: :pets
  has_many :appointments, through: :pets

  has_one_attached :photo

  has_many :journal_entries_as_owner, through: :pets, source: :journal_entries

  acts_as_favoritor
end
