class Procedure < ApplicationRecord
  has_many :procedure_category_relations
  has_many :categories, through: :procedure_category_relations
  #belongs_to :user
  has_many :bookmarks, dependent: :destroy

  has_one_attached :image

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
