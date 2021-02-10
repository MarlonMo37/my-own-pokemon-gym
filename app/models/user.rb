class User < ActiveRecord::Base
    has_many :teams
    has_many :pokemon, through: :teams
end