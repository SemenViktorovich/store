
module Books
  class Save
    include Interactor

    delegate :book, to: :context
    delegate :params, to: :context

    def call
      book = Book.new(params)
      if book.save
        context.book = book
      else
        context.error = "Boom!"
      end
    end
  end
end