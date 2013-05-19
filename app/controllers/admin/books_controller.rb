class Admin::BooksController < ApplicationController
# GET /books
# GET /books.json
  def index
    @page_title = t(:listing_books)
    sort_by = params[:sort_by]
    @books = Book.paginate(:page => params[:page], :order => sort_by, :per_page => 10)
  end
# GET /books/1
# GET /books/1.json
  def show
    @book = Book.find(params[:id])
    @page_title = "#{@book.title}"
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book }
    end
  end
# GET /books/new
# GET /books/new.json
  def new
    load_data
    @book = Book.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book }
    end
  end
# GET /books/1/edit
  def edit
    load_data
    @book = Book.find(params[:id])
  end
# POST /books
# POST /books.json
  def create
    @book = Book.new(params[:book])
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: t(:book_was_successfully_created) }
        format.json { render json: @book, status: :created, location:@book }
      else
        load_data
        format.html { render action: "new" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
# PUT /books/1
# PUT /books/1.json
  def update
    @book = Book.find(params[:id])
    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, notice: t(:book_was_successfully_updated) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
# DELETE /books/1
# DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :no_content }
    end
  end
  private
  def load_data
    @authors = Author.all
    @publishers = Publisher.all
  end
end