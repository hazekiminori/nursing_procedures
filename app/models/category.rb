class Category < ApplicationRecord
  
  has_many :procedures, dependent: :destro
end
