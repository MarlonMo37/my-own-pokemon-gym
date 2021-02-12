class SessionsController < ApplicationController

    get "/login" do
        erb :"/sessions/login"
    end

    post "/login" do
        user = User.find_by_email(params["user"]["email"])
        if user && user.authenticate(params["user"]["password"])
            flash[:success] = "Logged in successfully"
            redirect "/teams"
        else
            flash[:error] = "Username or password incorrect"
            redirect "/login"
        end
    end

    get "/logout" do
        session.clear
        redirect "/"
    end
end