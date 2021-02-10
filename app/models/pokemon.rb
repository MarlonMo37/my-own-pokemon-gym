class Pokemon < ActiveRecord::Base
    has_many :pokemonteams
    has_many :teams, through: :pokemonteams
end