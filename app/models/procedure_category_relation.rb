class ProcedureCategoryRelation < ApplicationRecord
  belongs_to :category
  belongs_to :procedure
end
