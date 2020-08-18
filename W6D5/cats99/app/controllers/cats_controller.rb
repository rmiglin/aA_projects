class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def show
        @cat = Cat.find_by(id: params[:id])
        render :show
    end

    def new
        render :new
    end

    def create
        @cat = Cat.new(params[:cat])

        if @cat.save
            redirect_to cat_url(@cat)
        else
            render :new
        end
    end
end