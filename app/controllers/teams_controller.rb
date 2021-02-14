class TeamsController < ApplicationController

    get "/teams" do
        if logged_in?
            @teams = current_user.teams
            # binding.pry
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
        # binding.pry
        erb :"/teams/show"
    end

    get "/teams/:id/edit" do

    end
 





end