class Category < ApplicationRecord
  
  has_many :procedures, dependent: :destroy
  
end
