class User < ApplicationRecord
  has_many :user_medications
  has_many :medications, through: :user_medications
end
