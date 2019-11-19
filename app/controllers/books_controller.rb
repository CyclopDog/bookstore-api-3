class BooksController < ApplicationController
  def index
    render json: Book.order('title ASC')
  end

  def create
    render json: Book.create(book_params)
  end

  def destroy
    render json: Book.find(params[:id]).destroy
  end

  private
    def book_params
      params.permit(:title, :category)
    end
end
