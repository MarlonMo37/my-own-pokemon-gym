class Pokemon < ActiveRecord::Base
    has_many :pokemonteams
    has_many :teams, through: :pokemonteams
    validates :name, presence: true
    validates :primary_type, presence: true
    validates :nature, presence: true
    validates :ability, presence: true
end