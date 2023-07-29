class FavoritesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
    
    before_action :set_cart, only:[:show, :destroy]

    def show
    end

    def new
        @favorite = Favorite.new
    end

    def create
        @favorite = Favorite.new(favorite_params)
        if @favorite.save
            redirect_to favorite_url(@favorite), notice: "Favorite was successfully created!"
        else
            render :new
        end
    end

    def index
      @favorites = current_user.favorites
    end
  
    def destroy
        @favorite.destroy if @favorite.id == session[:favorite_id]
        session[:favorite_id] = nil
        redirect_to root_path, notice: 'Favorite property was successfully destroyed.' 
    end

    private

    def set_cart
        @favorite = Favorite.find(params[:id])
    end


  
    def favorite_params
      params.fetch(:favorite, {})
    end

    def invalid_cart
        logger.error "Invalid Favorite property #{params[:id]}"
        redirect_to root_path, notice: "This property never belonged here!"
    end
end
  