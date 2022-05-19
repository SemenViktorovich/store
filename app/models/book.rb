# frozen_string_literal: true

class Book < ApplicationRecord
  has_many :comments, dependent: :delete_all
  has_one :user
  mount_uploader :image, ImageUploader
end
