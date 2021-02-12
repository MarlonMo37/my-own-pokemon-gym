require './config/environment'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, ENV['SESSION_SECRET']
        register Sinatra::Flash
    end

    get '/' do
        erb :welcome
    end

    helpers do

    end
end