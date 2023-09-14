class RelationshipsController < ApplicationController
    skip_before_action :verify_authenticity_token

    #GET users/:id/follow
    def show 
        @users = User.find(params[:id])
        
    end 

    #POST /users/:id/follow/:follower
    def create

    end

    #DELETE /users/:id/follow/:follower
    def destroy

    end

end
