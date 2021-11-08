class DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  
  def index
    if params[:query].present?
      @drinks = Drink.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @drinks = Drink.all
    end
  end

  def show
    @drink = Drink.find(params[:id])
    @review = Drink.new
    # if @drink.reviews.present?
    #   @ratings = Review.where(drink_id: @drink).average(:rating).truncate(2)
    # else
    #   render 'show'
    # end
  end

  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)

    if @drink.save
      flash[:notice] = "Item was saved!"
      redirect_to @drink
    else
      flash.now[:alert] = "ERROR. ERROR."
      render :new
    end

    if params[:drink].present?
      file = params[:drink][:file]
      File.open(Rails.root.join('app', 'assets', 'images', file.original_filename), 'wb') do |f|
        f.write(file.read)
      end
    end
  end

  def edit
    @drink = Drink.find(params[:id])
  end

  def update
    @drink = Drink.find(params[:id])
    @drink.update(drink_params)

    redirect_to drink_path(@drink)
  end

  def destroy
    @drink = Drink.find(params[:id])
    @drink.destroy

    redirect_to drinks_path
  end

  def favorite
    @drink = Drink.find(params[:id])
    type = params[:type]
    if type == "favorite"
      current_user.favorites << @drink
      redirect_back fallback_location: root_path, notice: 'You favorited #{@drink.name}'
    elsif type == 'unfavorite'
      current_user.favorites.delete(@drink)
      redirect_back fallback_location: root_path, notice: 'Unfavorited #{@drink.name}'
    else
      redirect_back fallback_location: root_path, notice: 'Nothing happened.'
    end
  end

  private

  def drink_params
    params.require(:drink).permit(:name, :description, :size, :ice, :flavours, :milk, :shot, :toppings, :file, :rating)
  end

  def set_drink
    @drink = Drink.find(params[:id])
  end
end
