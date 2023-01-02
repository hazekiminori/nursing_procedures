class Category < ApplicationRecord
  
  has_many :procedure_category_relations
  has_many :procedures, through: :procedure_category_relations, dependent: :destroy

  def self.search(keyword)
    where(["name like?", "%#{keyword}%"])
  end

end
