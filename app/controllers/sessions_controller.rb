class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email]) 
    if @user && @user.authenticate(params[:session][:password]) 
      #redirect to user page
      render json: @user
    else 
      flash[:danger] = 'Invalid email/password combination' #Not quite right!
      render html: "invalid email or password"
    end
  end

  def destroy
  end
    
end
