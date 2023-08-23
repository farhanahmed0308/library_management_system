class BooksController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :ability, only: [:new]
    before_action :set_books, only: [:edit, :update, :show, :destory]
    def show
    end
    def index
        @books = Book.all
    end
    def new
        @book = Book.new
    end
    def create
        @book = Book.new(book_params)
        if @book.save
            redirect_to @book
        else
            render "new"
        end
    end
    def edit
    end
    def update
        if @book.update(book_params)
            redirect_to @book
        else
            render "edit"
        end
    end
    def destroy
        @book.destroy
        redirect_to books_path
    end
    private
    def set_books
        @book = Book.find(params[:id])
    end
    def book_params
        params.require(:book).permit(:title, :author, :isbn)
    end
    def ability
       redirect_to books_path unless current_user.has_role?('librarian')
    end
end
