class Category < ApplicationRecord
  
  has_many :procedures, dependent: :destroy

  def self.search(keyword)
    where(["name like?", "%#{keyword}%"])
  end

end
