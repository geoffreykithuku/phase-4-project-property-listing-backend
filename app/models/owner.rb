class Owner < ApplicationRecord
    has_many :properties
    has_many :reviews,through: :properties

    validates :username ,presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
