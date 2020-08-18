class ArtworksController < ApplicationController
    
    def index

        if params.has_key?(:user_id)
            #when we open rails routes we can see this associated 
            #user_id key is included now
           #artworks and shared_artworks
            @user = User.find(params[:user_id])
            @artworks = @user.artworks + @user.shared_artworks
        else
            @artworks = Artwork.all
        end 
        render json: @artworks
    end

    def create
        @artwork = Artwork.new(artwork_params)
       
        # replace the `user_attributes_here` with the actual attribute keys
        #will eventually use a helper strong params method 
        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @artwork = Artwork.find(params[:id]) 
        render json: @artwork 
    end

    def update
        @artwork = Artwork.find(params[:id]) 

     # like with #create, we want to have two different outcomes depending on if update is successful
     if @artwork.update(artwork_params) # like Bubble#save, Bubble#update returns boolean representing whether update was successful
       redirect_to artwork_url(@artwork) # redirect generates a GET request, with default status code of 302
     else
       render json: @artwork.errors.full_messages, status: 422
     end
    end

    def destroy
     @artwork = Artwork.find(params[:id]) # use this pattern whenever we need to retrieve a bubble using id wildcard

     @artwork.destroy
     render json: @artwork

     # redirects to index, using helper method for URI pattern of /bubbles (the path for index)
     #redirect_to artwork_url

   end

    private
    #this is a strong params method, ensures user can only set params that we permit
    def artwork_params 
        params.require(:artwork).permit(:title, :image_url, :artist_id)

    #    .require(:user) # takes name of key in params as arg, requires everything to be nested under this key
    #    .permit(:name) # 1 or more symbols corresponding to fields we want user to be able to set
    #    .permit(:email) # 1 or more symbols corresponding to fields we want user to be able to set (everything else is filtered out / ignored)
    end

    


end

