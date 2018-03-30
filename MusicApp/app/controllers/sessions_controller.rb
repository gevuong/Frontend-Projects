class SessionsController < ApplicationController
    # user requires logout before having access to #new and #create controller actions
    before_action :require_logout, only: [:new, :create]

    # verify user credentials to login
    def create 
        user = User.find_by_credentials(
                params[:user][:email],
                params[:user][:password]
            )
        if user
            login(user) 
            # data stored in flash is available in next controller action and can be used when redirecting. ":notice" is arbitrary, but semantically meaningful
            flash[:notice] = "Successfully logged in"
            redirect_to user_url(user) # redirect to show page
        else
            # cannot render user.errors.full_messages because user = nil
            flash.now[:errors] = ["Incorrect username and/or password"] 
            render :new 
        end 
    end 

    def new 
        render :new
    end 

    def destroy
        logout 
        redirect_to new_session_url
    end 
end
