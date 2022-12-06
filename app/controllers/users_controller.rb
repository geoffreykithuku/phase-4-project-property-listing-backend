class UsersController < ApplicationController
    has_many: reviews
    has_many: properties , through: :reviews
end
