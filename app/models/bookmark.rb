class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :procedure
  validates :user_id, uniqueness: { scope: :procedure_id }
  
  def self.create_all_ranks
    Bookmark.find(Bookmark.group(:procedure_id).where(created_at: Time.current.all_week).order('count(procedure_id) desc').limit(10).pluck(:procedure_id))
  end
  
end
