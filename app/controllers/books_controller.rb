class BooksController < ApplicationController
  def index
    render json: Book.order('title ASC')
  end

  def create
    Book.create(book_params)
  end

  def destroy
    Book.find(params[:id]).destroy
  end

  private
    def book_params
      params.permit(:title, :category)
    end
end
