class Procedure < ApplicationRecord
  belongs_to :category
  has_many :changes, dependent: :destroy
end
