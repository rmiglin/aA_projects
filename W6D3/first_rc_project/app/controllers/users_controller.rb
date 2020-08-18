class UsersController < ApplicationController
    
    def index
         # This action uses query string parameters because it gets run
  # by an HTTP GET request, but this does not make any difference
  # to the way in which the parameters are accessed. The URL for
  # this action would look like this in order to list activated
        #local host:3000/users/query='rossmiglin@gmail.com'
        if User.find(params[:query]) 
            @users = User.find(params[:query]) 
        else 
            @users = User.all 
        end
        render json: @users 
    end

    def create
        @user = User.new(user_params)
       
        # replace the `user_attributes_here` with the actual attribute keys
        #will eventually use a helper strong params method 
        if @user.save
            render json: @user
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find(params[:id]) 
        render json: @user 
    end

    def update
        @user = User.find(params[:id]) 

     # like with #create, we want to have two different outcomes depending on if update is successful
     if @user.update(user_params) # like Bubble#save, Bubble#update returns boolean representing whether update was successful
       redirect_to user_url(@user) # redirect generates a GET request, with default status code of 302
     else
       render json: @user.errors.full_messages, status: 422
     end
    end

    def destroy
     @user = User.find(params[:id]) # use this pattern whenever we need to retrieve a bubble using id wildcard

     @user.destroy
     render json: @user

     # redirects to index, using helper method for URI pattern of /bubbles (the path for index)
     #redirect_to user_url

   end

    private
    #this is a strong params method, ensures user can only set params that we permit
    def user_params 
        params.require(:user).permit(:username)

    #    .require(:user) # takes name of key in params as arg, requires everything to be nested under this key
    #    .permit(:name) # 1 or more symbols corresponding to fields we want user to be able to set
    #    .permit(:email) # 1 or more symbols corresponding to fields we want user to be able to set (everything else is filtered out / ignored)
    end

    


end

