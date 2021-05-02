class MaterialsController < ApplicationController
    get '/materials/:id/edit' do
        redirect '/' if !Helpers.is_logged_in?(session)
        @material = Material.find(params[:id])
        erb :"materials/edit"
    end
    get '/materials/new' do
        redirect '/' if !Helpers.is_logged_in?(session)
        @cosplay_id = params[:cosplay_id]
        @material = Material.new
        erb :"materials/new"
    end

    post '/materials' do
        #binding.pry
        redirect '/' if !Helpers.is_logged_in?(session)
        @material = Material.new(params[:material])
        @cosplay_id = @material.cosplay_id
        if (@material.save)
            redirect to "users/show"
        else
            erb :"materials/new"
        end
    end

    patch '/materials/:id' do
        redirect '/' if !Helpers.is_logged_in?(session)
        @material = Material.find(params[:id])
        if (@material.update)
            redirect to "users/show"
        else
            erb :"materials/new"
        end
    end

    delete '/materials/:id' do
        redirect '/' if !Helpers.is_logged_in?(session)
        @material = Material.find(params[:id])
        @material.destroy
        redirect "/users/show"
    end
end
