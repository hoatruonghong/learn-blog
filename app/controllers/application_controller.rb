class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    include SessionsHelper
    # include JsonWebToken
    # before_action :authenticate_request, except: [:hello]

    def hello
        render html: "hello, world!"
    end

    private
    def authenticate_request        # bug here
        header = request.headers["Authorization"]
        puts "check here"
        puts request
        if header
            header = header.split(" ").last
        end
        decoded = jwt_decode(header)
        @current_user = User.find(decoded[:user_id])
    end    
end
