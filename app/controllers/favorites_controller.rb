class FavoritesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_favorite
    before_action :set_favorite, only: [:show, :destroy]

    def show
    end

    def new
        @favorite = Favorite.new
    end

    def create
        #byebug
        @favorite = Favorite.new(favorite_params)
        if @favorite.save
            redirect_to favorite_url(@favorite), notice: "Favorite section was created successfully!!"
        else
            render :new
        end
    end

    
    def destroy
        @favorite.destroy if @favorite.id==sesion[:favorite_id]
        session[:favorite_id]=nil
        redirect_to root_path, notice: "Favorite session was successfully destroyed!!"
    end

    private

    def set_favorite
        @favorite = Favorite.find(params[:id])
    end

    def favorite_params
        params.fetch(:favorite, {})
    end

    def invalid_favorite
        logger.error "Attempt to access invalid favorite section #{params[:id]}"
        redirect_to root_path, notice: "Favorite section doesn't exist!"
    end
end
