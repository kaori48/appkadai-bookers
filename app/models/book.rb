class Book < ApplicationRecord
#バリデーション設定、空じゃないか
validates :title, presence: true
validates :body, presence: true
end