class Property < ApplicationRecord
  belongs_to :owner
  has_many :reviews
  has_many :users,through: :reviews


  validates :description,:location,:price,:owner_id,:image ,presence: true

end
