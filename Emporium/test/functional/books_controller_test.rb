require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, book: { blurb: @book.blurb, created_at: @book.created_at, isbn: @book.isbn, price: @book.price, published_at: @book.published_at, publisher_id: @book.publisher_id, title: @book.title, updated_at: @book.updated_at }
    end

    assert_redirected_to book_path(assigns(:book))
  end

  test "should show book" do
    get :show, id: @book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book
    assert_response :success
  end

  test "should update book" do
    put :update, id: @book, book: { blurb: @book.blurb, created_at: @book.created_at, isbn: @book.isbn, price: @book.price, published_at: @book.published_at, publisher_id: @book.publisher_id, title: @book.title, updated_at: @book.updated_at }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to books_path
  end
end
