class Team < ActiveRecord::Base 
    belongs_to :trainer, class_name: "User"
    has_many :pokemonteams
    has_many :pokemon, through: :pokemonteams
    validates :trainer, presence: true
    validates :name, presence: true

end