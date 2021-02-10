class Team < ActiveRecord::Base 
    belongs_to :trainer, class_name: "User"
    has_many :pokemonteams
    has_many :pokemon, through: :pokemonteams
    has_secure_password
    validates :password, confirmation: true
    validates :trainer, presence: true

end