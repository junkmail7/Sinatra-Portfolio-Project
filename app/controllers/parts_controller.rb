class PartsController < ApplicationController
    get '/parts' do
        if logged_in?
            @parts = Part.all
            erb :"parts/show.html"
        else
            redirect "/login"
        end
    end

    get '/parts/new' do
        if logged_in?
            erb :"parts/create.html"
        else
            redirect "/login"
        end
    end

    post '/parts' do
        @part = Part.create(:brand_name => params[:brand_name], :part_name => params[:part_name], :user_id => session[:user_id])
        redirect "/parts"
    end

    get '/parts/:id/edit' do
        if logged_in?
            @part = Part.find(params[:id])
            erb :"parts/edit.html"
        else
            redirect "/login" 
        end
    end

    post '/parts/:id' do
        @part = Part.find(params[:id])
        @part.update(params.select{|t|t=="brand_name" || t=="part_name"})
        redirect "/parts"
    end

    get '/parts/:id/delete' do
        if logged_in?
            Part.find(params[:id]).destroy
            redirect "/parts"
        else
            redirect "/login" 
        end
    end

end