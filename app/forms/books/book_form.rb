# frozen_string_literal: true

module Books
  class BookForm < ApplicationForm
    properties :name, :author, :date
    model :book
    validates :name, :author, :date, presence: true, length: { minimum: 3, maximum: 5 }
  end
end
