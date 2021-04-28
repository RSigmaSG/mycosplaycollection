class CosplaysController < ApplicationController
    get '/cosplays' do
        @cosplays = Tweet.all
        erb :"cosplays/index"
    end
    get '/cosplays/:id/edit' do
        @cosplay = Cosplay.find(params[:id])
        erb :"cosplays/edit_tweet"
    end
    get '/cosplays/new' do
        erb :"tweets/new"
    end

    get '/cosplays/:id' do
        @cosplay = Cosplay.find(params[:id])
        erb :"cosplays/show"
    end
    post '/cosplays' do
        #binding.pry
        if (params[:content] === "")
            redirect to "cosplays/new"
        else
            @cosplay = Cosplay.create(content: params[:content], user_id: Helpers.current_user(session).id)
            redirect to "cosplays/#{@cosplay.id}"
        end
    end
    patch '/cosplays/:id' do
        #binding.pry
        if (params[:content] === "")
            redirect to "cosplays/#{params[:id]}/edit"
        else
            @cosplay = Cosplayu.find(params[:id])
            @cosplay.update(content: params[:content])
            redirect to "cosplays/#{@cosplay.id}"
        end
    end
    delete '/cosplays/:id' do
        @cosplay = Cosplay.find(params[:id])
        @cosplay.destroy
        redirect "/cosplays"
      end
end
