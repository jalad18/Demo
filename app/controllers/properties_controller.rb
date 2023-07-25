class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    def index
        @properties = Property.all
    end

    def show
        @property = Property.find(params[:id])
    end

    def new
        @property = Property.new
    end

    def create
        @property = Property.new(property_params)
        #byebug
        @property.user_id = current_user.id

        if @property.save
          redirect_to properties_path(), notice: "Property created successfully!!"
        else
          render :new
        end
    end
      

    def edit
        @property = Property.find(params[:id])
    end

    def update
        @property = Property.find(params[:id])

        if @property.update(property_params)
            redirect_to properties_path(), notice: "Property created!!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @property = Property.find(params[:id])
        @property.destroy

        redirect_to properties_path(), notice: "Property Deleted!!", status: :see_other
    end
    private
    def set_property
        @property = Property.find(params[:id])
    end

    def property_params
        params.require(:property).permit(:name, :city, :country, :price, :status, :year, images: [])
    end

end
