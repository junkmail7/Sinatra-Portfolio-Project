class ApplicationController < Sinatra::Base
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret ,"test"
    end
    
    helpers do
        def logged_in?
            !!session[:username]
        end

        def current_user
            #User.find(session[:user_id])
        end
    end
end