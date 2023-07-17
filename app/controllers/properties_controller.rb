class PropertiesController < ApplicationController
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

        if @property.save
            redirect_to @property
        else
            render :new, status: :unprocessable_entity
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

        redirect_to properties_path, notice: "Property Deleted!!", status: :see_other
    end
    private

    def property_params
        params.require(:property).permit(:name, :city, :country, :price, :status, :year)
    end
end
