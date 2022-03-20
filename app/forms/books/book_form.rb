# frozen_string_literal: true

module Books
  class BookForm < Reform::Form
    properties :name, :author, :date
    model :book
    p '-------------'
    validates :name, :author, :date, presence: true, length: { minimum: 3, maximum: 5 }
  end
end
