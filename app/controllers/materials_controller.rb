class MaterialsController < ApplicationController
    get '/materials/:id/edit' do
        @materials = Cosplay.find(params[:id])
        erb :"materials/edit"
    end
    get '/materials/new' do
        erb :"materials/new"
    end

    post '/materials' do
        #binding.pry
        if (params[:content] === "")
            redirect to "materials/new"
        else
            @material = Material.create(params[:material])
            redirect to "users/show"
        end
    end

    patch '/materials/:id' do
        #binding.pry

        @material = Material.find(params[:id])
        @material.update(params[:material])
        redirect to "users/show"
    end

    delete '/cosplays/:id' do
        @material = Material.find(params[:id])
        @material.destroy
        redirect "/users/show"
    end
end