class UsersController < ApplicationController
    get '/' do
        redirect '/login'
    end
    
    get '/login' do
        erb :"users/login.html"
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            session[:username] = user.username
            redirect '/parts'
        else 
            redirect '/login'
        end
    end

    get '/logout' do
        session.destroy
        redirect '/login'
    end
    
    get '/signup' do
        erb :"users/signup.html"
    end

    post '/signup' do
        if params[:username] == "" || params[:password] == "" || User.find_by(:username => params[:username])
            redirect to '/signup'
        else
           @user = User.create(:username => params[:username], :password => params[:password])
           redirect '/login'
        end
    end
end