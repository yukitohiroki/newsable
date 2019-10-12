class Clip < ApplicationRecord
has_many :user_clips, dependent: :destroy
has_many :users, through: :user_clips

has_many :likes
has_many :opinions, dependent: :destroy
before_save :create_page #メソッド 呼び出し
  def create_page
    begin
      page = MetaInspector.new(url)
      self.title = page.title
      self.description = page.best_description
      self.image = page.images.best
    rescue => error
      errors.add(:base, "無効なURLです。")
      throw :abort
    end
  end

  def self.search(search)
  	return Clip.all unless search
    search ? where('CONCAT(title,description)  LIKE ?', "%#{search}%") : all
  end

end

