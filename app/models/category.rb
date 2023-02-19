class Category < ApplicationRecord
  has_many :procedures, dependent: :destroy

  def self.search(keyword)
    where(['name like?', "%#{keyword}%"])
  end

  # 検索方法分岐
  def self.looks(search, word)
    @category = if search == 'perfect_match'
                  Category.where('name LIKE?', "#{word}")
                elsif search == 'forward_match'
                  Category.where('name LIKE?', "#{word}%")
                elsif search == 'backward_match'
                  Category.where('name LIKE?', "%#{word}")
                elsif search == 'partial_match'
                  Category.where('name LIKE?', "%#{word}%")
                else
                  Category.all
                end
  end
end
