class ApplicationController < ActionController::Base
    # protect_from_forgery with: :null_session
    protect_from_forgery prepend: true
    #before_action :authenticate_account!

    def hello
        if account_signed_in?
            render json: {result: {current_account: current_account, account_session: account_session}}
        else
            render json: {result: "nothing"}
        end
    end

end
