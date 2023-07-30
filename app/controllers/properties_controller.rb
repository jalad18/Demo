class PropertiesController < ApplicationController
    before_action :set_property, only: [:show, :edit, :update, :destroy, :contact_now]
    before_action :authenticate_user!, except: [:index, :show]
    def index
        if params[:search].present?
            search_term = "%#{params[:search]}%"
            @properties = Property.where('name LIKE ? OR city LIKE ?', search_term, search_term).page(params[:page]).per(3)
        else
            @properties = Property.all.page(params[:page]).per(3)
        end
    end

    def show
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
    end

    def update

        if @property.update(property_params)
            redirect_to properties_path(), notice: "Property created!!"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def button_click_action
        @user = current_user 
        UserMailer.button_click_email(@user).deliver_now
        redirect_to properties_path(), notice: 'Email sent!'
    end

    def destroy
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
