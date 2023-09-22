class BooksController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :ability, only: [:new]
  before_action :set_books, only: %i[edit update show destory]
  def show; end

  def index
    @q = Book.ransack(params[:query])
    @books = @q.result(distinct: false)
    # @books = Book.all
    flash[:notice] = 'record not found' if @books.empty?
  end
  def modify_book
    @books = Book.all
  end

  def status_update
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @page_title = "New Book"
    @method_defined = :post
  end

  def create
    case params[:book][:type]
    when 'Book'
      @book = Book.new(book_params)
    when 'EBook'
      @book = EBook.new(book_params)
    when 'Periodical'
      @book = Periodical.new(book_params)
    end
    @book.user = current_user
    if @book.save
      flash[:notice] = 'Book saved successfully'
      redirect_to book_url(@book)
    else
      flash[:notice] = 'Error'
      render 'new'
    end
  end

  def edit
    @page_title = "Update Book"
    @method_defined = :patch
  end

  def update
    if @book.update(book_params)
      flash[:notice] = "successfully updated"
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    Booking.where(book_id: @book).destroy_all
    Reservation.where(book_id: @book).destroy_all
    @book.destroy
    redirect_to books_path
  end

  private

  def set_books
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :isbn, :status, :pdf, :front_page, :type)
  end

  def ability
    redirect_to books_path unless current_user.has_role?('librarian')
  end
end
