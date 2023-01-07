class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :procedure
  validates :user_id, uniqueness: { scope: :procedure_id }
end
