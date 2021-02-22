class TeamsController < ApplicationController


    get "/teams" do
        if logged_in?
            @teams = current_user.teams
            erb :'/teams/index'
        else
            redirect "/login"
        end
    end

    get "/teams/new" do
        if logged_in?
            erb :"/teams/new"
        else
            redirect '/login'
        end
    end

    post "/teams" do
        if logged_in?
            @team = Team.new(name: params[:name], trainer_id: current_user.id)
            @team.save
            
            redirect "/teams"
        else
            redirect "/login"
        end
    end

    get "/teams/:id" do
        if logged_in?
            @team = current_user.teams.find_by(id: params[:id])
            erb :"/teams/show"
        else
            redirect "/login"
        end
    end

    get "/teams/:id/edit" do
        if logged_in?
            @team = current_user.teams.find_by(id: params[:id])
            erb :"/teams/edit"
         else
            redirect "/login"
        end
    end
 

    patch "/teams/:id" do
        if logged_in?
            @team = current_user.teams.find_by(id: params[:id])
            if params[:name] != ""
                @team.name = params[:name]
                @team.save
            end
            redirect "/teams/#{@team.id}"
        else
            redirect "/login"
        end
    end

    delete "/teams/:id" do
        @user = current_user
        if logged_in? && @user.teams.find(params[:id])
            @team = Team.find(params[:id])
            @team.delete
            redirect "/teams"
        else
            flash[:message] = "Unable To Delete #{@team.name}"
            redirect "/teams"
        end
    end
end