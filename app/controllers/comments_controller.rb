# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.create(comment_params)
    @comment = @book.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to book_path(@book)
  end

  private

  def comment_params
    params.require(:comment).permit(:username, :body)
    params.require(:comment).permit(:body)
  end
end
