class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  USERS_PARAMS = %i(email password password_confirmation).freeze

  validates :email, presence: true,
    length: {minimum: 10,
             maximum: 25},
    uniqueness: {case_sensitive: false},
    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}

  validates :password, presence: true,
  length: {minimum: 6,
           maximum: 25},
  allow_nil: true
end
