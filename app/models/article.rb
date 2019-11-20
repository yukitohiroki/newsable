class Article < ApplicationRecord
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :comments, as: :commentable

  require "date"
  def upcase_title
  	self.title = title.upcase
  	self.title = title +  " " + Date.today.to_s
  end

 def reading_time_predicition
  # 文字数を取得する
  text_count = body.size

  # 文字数を100（1分）で割って、この記事を読むのに何分かかるかをreading_time変数に入れる
  reading_time = text_count / 100

  # 0が返ってきたら1分以内、それ以上だったら〜分を返す
  reading_time == 0 ? "1分以内" : "約#{reading_time}分"
 end

  def self.find_tests
   Article.last
  end

end
