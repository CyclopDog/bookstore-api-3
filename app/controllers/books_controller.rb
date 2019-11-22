class BooksController < ApplicationController
  before_action :is_logged

  def index
    render json: Book.order('title ASC')
    render json: {status: 'logged'}
  end

  def create
    book = Book.new(book_params)
    book.user_id = session[:user_id]
    if book.save
      book.create
      render json: {status: 'logged'}
    else
      render json: book.errors.full_messages
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
      params.require(:book).permit(:title, :category)
    end

    def is_logged
      if session[:user_id]
        render json: { status: 'logged' }
      else
        render json: { status: 'not_logged' }
      end
    end
end
