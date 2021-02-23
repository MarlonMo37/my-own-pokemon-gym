class UsersController < ApplicationController
    
    get '/signup' do
        erb :"/users/signup"
    end

    post '/signup' do
        @user = User.create(params["user"])
        if @user.valid?
            flash[:success] = "Information succesfully submited"
            session[:user_id] = @user.id
            redirect '/teams'
        else
            flash[:error] = @user.errors.full_messages.first
            redirect '/signup'
        end
    end

end