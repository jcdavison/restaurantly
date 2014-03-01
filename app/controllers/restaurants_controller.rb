class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find_by_id params[:id]
    if @restaurant
      render :show
    else
      flash[:warning] = "sorry that restaurant doesn't exist"
      redirect_to root_path
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    name = params[:restaurant][:name] if params[:restaurant]
    @restaurant = Restaurant.new name: name
    if @restaurant.save
      flash[:success] = "#{@restaurant.name} created"
      redirect_to restaurant_path @restaurant
    else
      flash[:warning] = @restaurant.errors.inspect
      redirect_to new_restaurant_path
    end
  end

  def edit
    @restaurant = Restaurant.find_by_id params[:id]
    if @restaurant
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    @restaurant = Restaurant.find_by_id params[:id]
    if @restaurant
      @restaurant.update_attributes(name: params[:restaurant][:name])
      flash[:success] = "Name Updated!"
      redirect_to restaurant_path @restaurant
    else
      flash[:alert] = "Houston, we have a problem"
      redirect_to root_path
    end
  end

  def destroy
    @restaurant = Restaurant.find_by_id params[:id]
    @restaurant.destroy
    redirect_to root_path
  end
end
