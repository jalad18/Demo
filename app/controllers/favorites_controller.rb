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
        #session[:cart_id]
        @favorite.destroy if @favorite.id == session[:favorite_id]
        session[:favorite_id] = nil
        redirect_to root_path, notice: 'Favorite property was successfully destroyed.' 
    end

    # def create
    #   @favorite = current_user.favorites.build(favorite_params)
  
    #   respond_to do |format|
    #     if @favorite.save
    #       format.html { redirect_to @favorite.property, notice: "Property added to favorites." }
    #       format.json { render :show, status: :created, location: @favorite }
    #     else
    #       format.html { redirect_to root_path, alert: "Failed to add property to favorites." }
    #       format.json { render json: @favorite.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end

    private

    def set_cart
        @favorite = Favorite.find(params[:id])
    end


  
    def favorite_params
      #params.require(:favorite).permit(:property_id)
      params.fetch(:favorite, {})
    end

    def invalid_cart
        logger.error "Invalid Favorite property #{params[:id]}"
        redirect_to root_path, notice: "This property never belonged here!"
    end
end
  