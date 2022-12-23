class Procedure < ApplicationRecord
  has_many :procedure_category_relations
  has_many :categories, through: :procedure_category_relations
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  
  has_one_attached :image
  
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
  
end
