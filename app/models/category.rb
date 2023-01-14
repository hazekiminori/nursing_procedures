class Category < ApplicationRecord
  
  has_many :procedures, dependent: :destroy

  def self.search(keyword)
    where(["name like?", "%#{keyword}%"])
  end
  
  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @category = Category.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @category = Category.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @category = Category.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @category = Category.where("name LIKE?","%#{word}%")
    else
      @category = Category.all
    end
  end

end
