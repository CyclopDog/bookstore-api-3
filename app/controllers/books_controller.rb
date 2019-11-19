class BooksController < ApplicationController
  def index
    render json: Book.order('title ASC')
  end

  def create
    respond_to do |format|
      format.json { Book.create(book_params) }
    end
  end

  def destroy
    respond_to do |format|
      format.json { Book.find(params[:id]).destroy }
    end
  end

  private
    def book_params
      params.permit(:title, :category)
    end
end
