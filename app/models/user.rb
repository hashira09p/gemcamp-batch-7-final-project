class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  enum role: { client: 0, admin: 1 }

  validates :phone, presence: true, phonelib: { country: 'PH' }
end
