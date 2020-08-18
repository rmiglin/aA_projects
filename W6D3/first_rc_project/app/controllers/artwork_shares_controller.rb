class ArtworkSharesController < ApplicationController

    def create
        @artwork_share = ArtworkShare.new(artwork_share_params)
        if @artwork_share.save
            render json: @artwork_share
        else
            render json: @artwork_share.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @artwork_share = ArtworkShare.find(params[:id]) # use this pattern whenever we need to retrieve a bubble using id wildcard

        @artwork_share.destroy
        render json: @artwork_share

        # redirects to index, using helper method for URI pattern of /bubbles (the path for index)
        #redirect_to user_url

    end

    def artwork_share_params
        params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
    end

end