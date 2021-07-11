class BooksController < ApplicationController

def index
  @books = Book.all
  @book = Book.new
end

 def create
  # １. データを新規登録するためのインスタンス作成
  @book = Book.new(book_params)
  # ２. データをデータベースに保存するためのsaveメソッド実行@は画面に表示させる必要
  @book.save
  # ３. トップ画面へリダイレクト＊後で変更
  redirect_to '/books'
 end

 def show
  @book = Book.find(params[:id])
 end

  private
  # ストロングパラメータ(下段に書く)
  def book_params
   params.require(:book).permit(:title, :body)
  end
end
