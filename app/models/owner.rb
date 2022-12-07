class Owner < ApplicationRecord
    has_many :properties
    has_many :reviews,through: :properties
end
