class UsersController < ApplicationController
    
    get '/signup' do
        if logged_in?
            redirect "/teams"
        else
            erb :"/users/signup"
        end
    end

    post '/signup' do
        user = User.create(params["user"])
        if user.valid?
            flash[:success] = "Information succesfully submmited"
            session[:user_id] = user.id
            redirect '/teams'
        else
            flash[:error] = user.errors.full_messages.first
            redirect '/signup'
        end
    end
end