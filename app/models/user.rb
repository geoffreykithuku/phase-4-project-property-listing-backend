class User < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :properties , through: :reviews
    has_secure_password

    validates :username ,presence: true

    validates :email,
        format: { with: /\A(.+)@(.+)\z/, message: "invalid"  },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 72 }

end
