class Category < ApplicationRecord
  
  has_many :procedure_category_relations
  has_many :procedures, through: :procedure_category_relations

  def self.search(keyword)
    where(["name like? OR body like?", "%#{keyword}%", "%#{keyword}%"])
  end

end
