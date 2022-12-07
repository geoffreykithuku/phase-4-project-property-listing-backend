class Owner < ApplicationRecord
    has_many :properties
    has_many :reviews,through: :properties

    validates :username ,presence: true

    validates :email,
        format: { with: /^(.+)@(.+)$/, message: "Email invalid"  },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }
end
