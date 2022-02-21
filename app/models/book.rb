class Book < ApplicationRecord
	validates :name, presence: true, length: { minimum: 2 }
	validates :author, presence: true, length: { minimum: 2 }
	validates :date, presence: true, length: { minimum:4 }
end
