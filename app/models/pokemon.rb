class Pokemon < ActiveRecord::Base

    NATURES = [
        "Hardy", "Lonely", "Brave", "Adamant", "Naughty", 
        "Bold", "Docile", "Relaxed", "Impish", "Lax",
        "Timid", "Hasty", "Serious", "Jolly", "Naive", 
        "Modest", "Mild", "Quiet", "Bashful", "Rash",
        "Calm", "Gentle", "Sassy", "Careful", "Quirky"
    ]

    
    has_many :pokemonteams
    has_many :teams, through: :pokemonteams
    validates :name, presence: true
    validates :primary_type, presence: true
    validates :nature, presence: true
    validates :ability, presence: true
    validates :avatar, presence: true

    def self.get_pokemon
        url = "https://pokeapi.co/api/v2/pokemon/#{rand(1..251)}"
    end

    def self.get_poke_info(url)
        info = {}
        uri = URI.parse(url)
        response = Net::HTTP.get(uri)
        poke = JSON.parse(response)
        info["name"] = poke["name"]
        info["primary_type"] = poke["types"][0]["type"]["name"]
        if poke["types"][1]
            info["secondary_type"] = poke["types"][1]["type"]["name"]
        end
        info["nature"] = NATURES[rand(0..24)]
        info["avatar"] = poke["sprites"]["other"]["official-artwork"]["front_default"]
        info["sprite"] = poke["sprites"]["front_default"]
        if poke["abilities"][2]
            info["ability"] = poke["abilities"][rand(0..2)]["ability"]["name"]
        elsif poke["abilities"][1]
            info["ability"] = poke["abilities"][rand(0..1)]["ability"]["name"]
        else 
            info["ability"] = poke["abilities"][0]["ability"]["name"]
        end
        Pokemon.create(info)
    end

end