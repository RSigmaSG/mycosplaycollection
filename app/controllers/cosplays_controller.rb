class CosplaysController < ApplicationController
    get '/cosplays' do
        @cosplays = Material.all
        erb :"cosplays/index"
    end
    get '/cosplays/:id/edit' do
        redirect '/' if !Helpers.is_logged_in?(session)
        @cosplay = Cosplay.find(params[:id])
        erb :"cosplays/edit"
    end
    get '/cosplays/new' do
        redirect '/' if !Helpers.is_logged_in?(session)
        @cosplay = Cosplay.new
        erb :"cosplays/new"
    end

    get '/cosplays/:id' do
        redirect '/' if Helpers.is_logged_in?(session)
        @cosplay = Cosplay.find(params[:id])
        @materials = @cosplay.materials
        erb :"cosplays/show"
    end
    post '/cosplays' do
        #binding.pry
        redirect '/' if Helpers.is_logged_in?(session)
        @cosplay = Cosplay.new(params[:cosplay])
        @cosplay.user_id = Helpers.current_user(session).id
        if (@cosplay.save)
            redirect to "users/show"
        else
            erb :"cosplay/new"
        end
    end
    patch '/cosplays/:id' do
        #binding.pry
        redirect '/' if Helpers.is_logged_in?(session)
        @cosplay = Cosplay.find(params[:id])
        if (@cosplay.update)
            redirect to "users/show"
        else
            erb :"cosplay/new"
        end
    end
    delete '/cosplays/:id' do
        redirect '/' if Helpers.is_logged_in?(session)
        @cosplay = Cosplay.find(params[:id])
        @cosplay.materials.each do |material| 
            material.destroy
        end
        @cosplay.destroy
        redirect "/users/show"
    end
end
