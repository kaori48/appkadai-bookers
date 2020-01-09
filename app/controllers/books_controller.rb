class BooksController < ApplicationController

#top画画
  def top
  end

#詳細画面
  def index
  	@books = Book.all.order(id: "ASC")#データ新しい順にを並べる機能
  	#投稿機能,viewに渡すための空のモデルオブジェクト
  	@book = Book.new
  end

#フォーム投稿
  def create
  	@book = Book.new(book_params)
  	if
        @book.save
        flash[:ok] = 'Book was successfully created.'   #作成成功メッセージ出す
        redirect_to book_path(@book.id) #showへリダイレクト。入力で割り振られたidを表示
      else
        @books = Book.all.order(id: "ASC") #失敗時の処理がわからない？
        render action: :index #詳細画面??????に戻る
        #バリデーションのエラーはmodelで設定
    end
  end

# 投稿内容確認
  def show
    @book = Book.find(params[:id])
  end

#投稿
  def edit
  	@book = Book.find(params[:id])
  end

#更新
  def update#更新できたらのif描きたい
    book = Book.find(params[:id])
    if
      book.update(book_params)
      flash[:ok] = 'Book was successfully updated.'   #作成成功メッセージ出す
      redirect_to book_path(book.id)#showへリダイレクト,idsyotoku
    else
      #失敗時の処理？
      render action: :edit#投稿画面に戻る？
      #バリデーションのエラーはmodelの方で行う
    end
  end
#削除
 def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
 end


private
 def book_params
   params.require(:book).permit(:title,:body)
 end
end
