class Pokemonteam < ActiveRecord::Base
    belongs_to :pokemon
    belongs_to :team
    
end