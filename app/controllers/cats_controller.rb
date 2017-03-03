class CatsController < ApplicationController
  before_action :require_login

  def new
  end

  def create
    colors = ['oreo', 'white', 'grey', 'rave', 'cheetah']
    cat = Cat.create name: params[:name], color: colors.sample, power_output: rand(100), status: 'running'
    redirect_to cat
  end

  def show
    @cat = Cat.find params[:id]
  end

  def index
    @cats = Cat.all
    @total_power = 0
    @cats.each do |cat|
      @total_power += cat.power_output
    end
  end

  def destroy
    Cat.find(params[:id]).destroy
    redirect_to cats_url, notice: 'Cat deallocated.'
  end

  def tick
    Cat.all.each do |cat|
      if rand(5) == 1
        cat.power_output = 0
        cat.status = 'resting'
        cat.save
      end
    end
  end

  private
  def require_login
    unless session[:user_id]
      redirect_to user_login_url, alert: 'You must be signed in to access this page.'
    end
  end
end
