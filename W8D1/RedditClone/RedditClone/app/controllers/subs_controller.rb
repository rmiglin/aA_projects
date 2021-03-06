class SubsController < ApplicationController
    
    before_action :ensure_logged_in

    def index
        @subs = Sub.all 
        render :index
    end

    def new
        @sub = Sub.new 
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.user_id = current_user.id 
        if @sub.save
            render :show
        else
            flash[:errors] = @sub.errors.full_messages
            redirect_to new_sub_url
        end
    end

    def edit
        @sub = Sub.find(params[:id])
        render :edit 
    end

    def update
        @sub = Sub.find(params[:id]) 
        if @sub.update(sub_params)
            redirect_to sub_url(sub.id)
        else
            flash.now[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def show
        @sub = Sub.find(params[:id])
        render :show
    end

    def destroy
        @sub = Sub.find(params[:id])
        @sub.destroy
        redirect_to subs_url 
    end

    private
    def sub_params
        params.require(:sub).permit(:title,:description)
    end
end
