class UsersController < ApplicationController

    get "/users/signup" do
        if Helpers.is_logged_in?(session)
            redirect "/"
        else
            @user = User.new
            erb :"users/signup"
        end
    end

    post "/users/signup" do
        @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
        
        if @user.save
            session[:user_id] = @user.id
            redirect '/'
         else
            erb :'users/signup'
        end
    end

    get "/users/login" do
        erb :"/users/login"
    end

    post "/users/login" do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/users/show"
        else
            redirect "/users/login"
        end
    end


    get "/users/logout" do
        session.clear
        redirect "/"
    end

    get '/users/show' do
        if Helpers.is_logged_in?(session)
            @user = Helpers.current_user(session)
            @cosplays = @user.cosplays
            erb :"/users/show"
        else
            redirect "/"
        end
    end

    get '/users/:id' do
        @user =User.find(params[:id])
        @cosplays = @user.cosplays
        erb :"/users/page"
    end

end