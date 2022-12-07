class Owner < ApplicationRecord
    has_many :properties
    has_many :reviews,through: :properties

    validates :email ,:username ,presence: true
end
