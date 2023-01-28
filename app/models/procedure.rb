class Procedure < ApplicationRecord
  has_many :procedure_category_relations
  belongs_to :category, optional: true
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :procedure_changes, dependent: :destroy

  has_one_attached :image

  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
  
  
  
  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @procedure = Procedure.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @procedure = Procedure.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @procedure = Procedure.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @procedure = Procedure.where("title LIKE?","%#{word}%")
    else
      @procedure = Procedure.all
    end
  end

end
