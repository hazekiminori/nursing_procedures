class ProcedureChange < ApplicationRecord
  belongs_to :user
  belongs_to :procedure

  validates :change, presence: true
  validates :reason, presence: true
end
