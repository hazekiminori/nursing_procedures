class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :procedure
  varidates :user_id, uniqueness: { scope: :procedure_id }
end
