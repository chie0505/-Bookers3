class BooksController < ApplicationController



def index
  @books = Book.all
  @book = Book.new
  # @book = Book.find(params[:id])
end

def show
  @book = Book.find(params[:id])
end

# def create

#   # １. データを新規登録するためのインスタンス作成
#   @book = Book.new(book_params)
#   # ２. データをデータベースに保存するためのsaveメソッド実行
#   # @は画面に表示させる必要があるものにつける。Viewと対応していること
#   @book.save
#   redirect_to Book.find(@book.id)
#   # redirect_to Book.find(@book.id)
#   flash[:notice] = "Book was successfully created."
# end

def create
  @book = Book.new(book_params)
  if @book.save
    redirect_to Book.find(@book.id)
else
    @books = Book.all
    render 'index'
  end
  flash[:notice] = "Book was successfully created."
end

  # def create
  #     @book = Book.new(book_params)
  #     if @book.save
  #         redirect_to book_path(@book)
  #     else
  #         render :new
  #     end


 def edit
  @book = Book.find(params[:id])
 end


# if @book.save
#     redirect_to Book.find(@book.id)
# else
#     @books = Book.all
#     render 'index'
#     # render ("books/index")
#     # render new
#   end



 def update
  @book = Book.find(params[:id])
   if @book.update(book_params)
   redirect_to Book.find(params[:id])
    else
     render 'edit'
    end
  flash[:notice] = "Book was successfully updated."
 end


def destroy
  book = Book.find(params[:id])
  book.destroy
  redirect_to books_path
  flash[:notice] = "Book was successfully destroyed."
end


  private
  # ストロングパラメータ(下段に書く)
  def book_params
   params.require(:book).permit(:title, :body)
  end
end
