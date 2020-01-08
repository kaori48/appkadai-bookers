class BooksController < ApplicationController

#top画画
  def top
  end
#詳細画面
  def index
  	#データ新しい順にを並べる機能
  	@books = Book.all.order(id: "ASC")
  	#投稿機能,viewに渡すための空のモデルオブジェクト
  	@book = Book.new
  end
# 投稿内容確認
  def show
  	@book = Book.find(params[:id])
  end


#フォーム投稿
  def create
  	book = Book.new(book_params)
  	book.save
  	redirect_to book_path(book.id) #特定のidの投稿内容表示
  end
#投稿
  def edit
  	@book = Book.find(params[:id])
  end

private
 def book_params
   params.require(:book).permit(:title,:body)
 end
end
