class BooksController < ApplicationController
  def index
    render json: current_user.books.order('title ASC')
  end

  def create
    book = current_user.books.new(book_params)
    if book.save

    else

    end
  end

  def destroy
    book = current_user.books.find(params[:id])
    if @book
      book.destroy
    end
  end

  private
    def book_params
      params.permit(:title, :category)
    end
end
