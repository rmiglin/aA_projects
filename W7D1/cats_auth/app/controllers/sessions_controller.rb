class SessionsController < ApplicationController

    before_action :ensure_logged_out, only: [:new, :create]

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(
            params[:user][:user_name],
            params[:user][:password]
        )

        if user
            login_user!(user)
            redirect_to cats_url
        else
            flash.now[:errors] = ['Invalid credentials']
            render :new, status: 422
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end
end