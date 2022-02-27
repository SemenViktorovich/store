# frozen_string_literal: true

class Book < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :author, presence: true, length: { minimum: 2 }
  validates :date, presence: true, length: { minimum: 4 }

  mount_uploader :image, ImageUploader

end
