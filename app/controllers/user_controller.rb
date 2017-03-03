class UserController < ApplicationController
  def login
    if request.post?
      user = User.find_by name: params[:name], password: params[:password]
      if user
        session[:user_id] = user.id
        redirect_to cats_url, notice: 'Login successful'
      else
        redirect_to user_login_url, alert: 'Invalid username or password'
      end
    end
  end

  def logout
    session.destroy
    redirect_to '/'
  end
end
