class Category < ApplicationRecord
  
has_many :procedure_category_relations
has_many :procedures, through: :procedure_category_relations
end
