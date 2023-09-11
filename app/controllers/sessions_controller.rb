class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  #GET /login
  def new
    render html: "get new session"
  end

  #POST /login
  def create
    @user = User.find_by(email: params[:session][:email]) 
    if @user && @user.authenticate(params[:session][:password]) 
      log_in @user
      remember @user
      puts current_user
      render json: {data: @user[:name]}
    else 
      flash[:danger] = 'Invalid email/password combination' #Not quite right!
      render html: "invalid email or password"
    end
  end
  
  #DELETE /logout
  def destroy
    if logged_in? 
      puts "ok"
    end
    log_out
    render html: "logout successfully"
  end
    
end
