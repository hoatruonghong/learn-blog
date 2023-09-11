class AuthenticationController < ApplicationController
    before_action :authenticate_request

    #post /api/login
    def login
        @user = User.find_by(email:params[:email])
        if @user & authenticate(params[:password])
            token = jwt_encode(user_id: @user.id)
            render json: token
        else 
            render html: "invalid email or password"
        end            
    end

    
end
