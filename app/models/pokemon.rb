class Pokemon < ActiveRecord::Base
    include API
    has_many :pokemonteams
    has_many :teams, through: :pokemonteams
    validates :name, presence: true
    validates :primary_type, presence: true
    validates :nature, presence: true
    validates :ability, presence: true

    def self.catch_pokemon

    end

end