class FavitemsController < ApplicationController
    before_action :set_favitem, only: %i[show edit update destroy]
    
    def index
      @favitems = Favitem.all
    end
  
    def show
    end
  
    def new
      @favitem = Favitem.new
    end
  
    def edit
    end
  
    def create
        property = Property.find(params[:property_id])
        begin
            @favitem = @favorite.add_item(item)
            if @favitem.save
                redirect_to @favitem.property, notice: 'Property added to favorites.'
            else
                render :new
            end
        rescue Exception => e
            redirect_to root_path, notice: e.message
        end
    end

    def update
      respond_to do |format|
        if @favitem.update(favitem_params)
          format.html { redirect_to @favitem, notice: "Favitem was successfully updated." }
          format.json { render :show, status: :ok, location: @favitem }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @favitem.errors, status: :unprocessable_entity }
        end
      end
    end
    
    def destroy
        @favorite = Favorite.find(session[:favorite_id])
        @favitem = Favitem.find(params[:id])
        @favitem.destroy
        redirect_to favorites_path(@favorite)
    end
  
    private
  
    def set_favitem
      @favitem = Favitem.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def favitem_params
      params.require(:favitem).permit(:property_id, :favorite_id)
    end
end
  