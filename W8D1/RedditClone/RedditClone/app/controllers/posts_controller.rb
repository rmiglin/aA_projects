class PostsController < ApplicationController
    
    before_action :ensure_logged_in

    def show
        @post = Post.find(params[:id])
        render :show
    end

    def edit
        @post = Post.find(params[:id])
        if allow_edit?(@post)
            render :edit
        else
            flash[:errors] = ["Don't have edit priviliges"]
            redirect_to post_url(@post.id)
        end
    end
    
    def update 
        @post = Post.find(params[:id])
        if allow_edit?(@post)
            if @post.update(post_params)
                redirect_to post_url(@post.id)
            else
                flash.now[:errors] = @post.errors.full_messages
                render :edit
            end
        else
            flash[:errors] = ["Don't have edit priviliges"]
            redirect_to post_url(@post.id)         
        end
    end

    def new
        @post = Post.new 
        render :new
    end
    
    def create
        @post = Post.new(post_params)
        @post.sub_id = params[:sub_id]
        @post.author_id = current_user.id
        if @post.save
            redirect_to post_url(@post.id)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_sub_post(params[:sub_id]), status: 422
        end
    end

    def destroy
        @post = Post.find(params[:id])
        sub_id = @post.sub_id
        if allow_edit?(@post)
            @post.destroy
        else
            flash[:errors] = ["Don't have edit priviliges"]
        end
        redirect_to sub_url(sub_id)
    end

    def allow_edit?(post)
        post.author_id == current_user.id || post.sub.moderator.id == current_user.id
    end

    private
    def post_params 
        params.require(:post).permit(:title,:url,:content, :sub_ids)
    end
end
