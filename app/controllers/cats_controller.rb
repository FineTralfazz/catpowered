class CatsController < ApplicationController
  before_action :require_login, except: :tick

  def new
  end

  def create
    colors = ['oreo', 'white', 'grey', 'rave', 'cheetah']
    cat = Cat.create name: params[:name], color: colors.sample, power_output: rand(100) + 100, status: 'running'
    redirect_to cat
  end

  def show
    @cat = Cat.find params[:id]
  end

  def index
    @cats = Cat.all
    @total_power = 0
    @cats.each do |cat|
      if cat.status == 'running'
        @total_power += cat.power_output
      end
    end
  end

  def destroy
    Cat.find(params[:id]).destroy
    redirect_to cats_url, notice: 'Cat deallocated.'
  end

  def tick
    Cat.all.each do |cat|
      if cat.status == 'resting'
        cat.power_output += rand(30)
        if rand(4) == 0
          cat.power_output += 50
          cat.status = 'running'
        end
      elsif cat.power_output < 0
        cat.power_output = 0
        cat.status = 'resting'
      else
        cat.power_output -= rand(20) + 10
      end
      cat.save
    end
  end

  def rest
    cat = Cat.find(params[:id])
    cat.status = 'resting'
    cat.save
    redirect_to cat
  end

  private
  def require_login
    unless session[:user_id]
      redirect_to user_login_url, alert: 'You must be signed in to access this page.'
    end
  end
end
