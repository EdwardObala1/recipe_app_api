class UsersController < ApplicationController
# /signup

  def signup_landing
    @user = User.all
    render json: @user.to_json
  end

  def signup
    user_exists = User.exists?(email: params[:email])  
    if user_exists
    #   notice 'Email in use if these are your details sign in or create a new account'
    else
      @user = User.create(user_params)
      redirect_to signin_path
    end
  end

  def signin_landing
    # @user = User.all
    render json: @user.to_json
  end

  def signin
    @user = User.all
    if @user.exists?(email: params[:email])
        # notice 'User exists'
      if @user.find_by(email: params[:email]).password == params[:password]
        # notice 'Successful authentification'
        session[:user_id] = @user.ids
      end
    else 
    #   notice 'User doess not exist'
    end
  end

  def logout_landing
  end

  def logout
    if request.post?
        session[:user_id] = nil
        redirect_to root_path, notice: "You are signed out"   
    end
  end

  def user_params
    params.permit(:name, :email, :password)
  end
end
