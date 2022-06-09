class BooksController < ApplicationController

   def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @book = Book.new
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id), notice: "Book was successfully created"
    else
      @books = Book.all
      render :index, status: :unprocessable_entity#<= new から indexに変更
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])

  end

   def update
    @book = Book.find(params[:id])

   if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "Book was successfully updated"
   else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/books', status: :see_other
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :status)
  end

end
