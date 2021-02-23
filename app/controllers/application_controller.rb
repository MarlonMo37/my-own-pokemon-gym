# require './config/environment'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, ENV['SESSION_SECRET']
        register Sinatra::Flash
    end

    get '/' do
        redirect "/signup"
    end

    get '/signin' do
      redirect '/login'
    end

    error Sinatra::NotFound do
      erb :"error"
    end

    helpers do
        def current_user
          User.find(session[:user_id]) if session[:user_id]
        end
    
        def logged_in?
          !!current_user
        end
    end
end