module API
     
    def get_pokemon
        @url = "https://pokeapi.co/api/v2/pokemon/#{rand(1..251)}"
    end

    def get_poke_info(url)
        uri = URI.parse(url)
        response = Net::HTTP.get(uri)
        info = JSON.parse(response)
        Pokemon.create(info)
    end

   


end
