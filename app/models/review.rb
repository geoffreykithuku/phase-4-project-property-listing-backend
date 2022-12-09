class Review < ApplicationRecord
  belongs_to :property
  belongs_to :user

  validates :user_id, :property_id , :description, presence: true
end
