# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_book, only: %i[show edit update destroy]
  skip_before_action :verify_authenticity_token
  before_action :set_search, only: %i[index edit update show new]

  def index
    @pagy, @books = pagy(@q.result, items: 5)
  end

  def new
    @book = Book.new
  end

  def create
    book = Book.new
    result = Books::Save.call(params: book_params, book: book)
    if result.success?
      redirect_to books_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @book.update book_params
      flash[:success] = 'success'
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:success] = 'success'
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find params[:id]
  end

  def book_params
    params.require(:book).permit(:name, :author, :date, :image)
  end

  def set_search
    @q = Book.ransack(params[:q])
  end
end
