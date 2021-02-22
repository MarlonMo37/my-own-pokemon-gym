class PokemonController < ApplicationController

    post "/teams/:id/pokemon" do
        if logged_in?
            url = Pokemon.get_pokemon
            poke = Pokemon.get_poke_info(url)
            @team = Team.find(params[:team_id])
            @team.pokemon << poke
            flash[:success] = "You caught a #{poke.name.capitalize}!!"
            redirect "/teams/#{@team.id}/edit"
            
        else
            redirect "/login"
        end
    end

    delete "/pokemon/:id" do
        if logged_in?
            poke = current_user.pokemon.find_by(id: params[:id])
            @team = poke.teams.first
            poke.delete
            flash[:success] = "Pokemon succesfully released"
            redirect "/teams/#{@team.id}/edit"
        else 
            redirect "/login"
        end
    end
end