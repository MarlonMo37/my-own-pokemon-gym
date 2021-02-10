class Pokemonteam < ActiveRecord::Base
    belongs_to :pokemon
    belongs_to :team
    validates :pokemon, presence: true
    validates :team, presence: true 
end