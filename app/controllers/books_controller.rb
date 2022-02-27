# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_book, only: %i[edit update destroy show]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
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
end
