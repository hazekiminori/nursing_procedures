class Procedure < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  
  has_one_attached :image
  
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
  
end
