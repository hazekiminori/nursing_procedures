class Procedure < ApplicationRecord
  belongs_to :category
  has_many :changes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
end
