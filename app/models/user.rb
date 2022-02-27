# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { client: 0, moderator: 1, admin: 2 }, _suffix: :role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar

end
