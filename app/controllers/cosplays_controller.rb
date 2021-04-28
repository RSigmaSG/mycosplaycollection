class CosplaysController < ApplicationController
    get '/cosplays' do
        @cosplays = Material.all
        erb :"cosplays/index"
    end
    get '/cosplays/:id/edit' do
        @cosplay = Cosplay.find(params[:id])
        erb :"cosplays/edit"
    end
    get '/cosplays/new' do
        erb :"cosplays/new"
    end

    get '/cosplays/:id' do
        @cosplay = Cosplay.find(params[:id])
        @materials = @cosplay.materials
        erb :"cosplays/show"
    end
    post '/cosplays' do
        #binding.pry
        if (params[:content] === "")
            redirect to "cosplays/new"
        else
            @cosplay = Cosplay.create(params[:cosplay])
            @cosplay.user_id = Helpers.current_user(session).id
            @cosplay.save
            redirect to "users/show"
        end
    end
    patch '/cosplays/:id' do
        #binding.pry
        if (params[:content] === "")
            redirect to "cosplays/#{params[:id]}/edit"
        else
            @cosplay = Cosplay.find(params[:id])
            @cosplay.update(params[:cosplay])
            redirect to "users/show"
        end
    end
    delete '/cosplays/:id' do
        @cosplay = Cosplay.find(params[:id])
        @cosplay.destroy
        redirect "/cosplays"
    end
end
