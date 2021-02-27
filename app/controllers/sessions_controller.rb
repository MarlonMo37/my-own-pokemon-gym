class SessionsController < ApplicationController

    get "/login" do
        if logged_in? 
            redirect '/teams'
        else
            erb :"/sessions/login"
        end
    end

    post "/login" do
        user = User.find_by_email(params["user"]["email"])
        if user && user.authenticate(params["user"]["password"])
            session[:user_id] = user.id
            flash[:success] = "Logged in successfully"
            redirect "/teams"
        else
            flash[:message] = "Username or password incorrect"
            redirect "/login"
        end
    end

    get "/logout" do
        session.clear
        redirect "/login"
    end
end