class IndexController < ApplicationController
  def index
    if session[:user_id]
      redirect_to cats
    end
  end
end
