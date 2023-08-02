# frozen_string_literal: true

class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy contact_now]
  before_action :authenticate_user!, except: %i[index show]
  load_and_authorize_resource param_method: :my_sanitizer
  def index
    if params[:search].present?
      search_term = "%#{params[:search]}%"
      @properties = Property.where('name LIKE ? OR city LIKE ?', search_term,
                                   search_term).page(params[:page]).per(3)
    else
      @properties = Property.all.page(params[:page]).per(3)
    end
  end

  def show
    @property = Property.find(params[:id])
    @favorite_properties = current_user.favorites.includes(:property).map(&:property)
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    # byebug
    @property.user_id = current_user.id

    if @property.save
      redirect_to properties_path, notice: 'Property created successfully!!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice: 'Property created!!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def add_to_cart
    @property = Property.find(params[:id])
    current_user.carts.find_or_create_by(property_id: @property.id)

    redirect_to cart_path(current_user.cart), notice: 'Property added to cart.'
  end

  def button_click_action
    @user = current_user
    UserMailer.button_click_email(@user).deliver_now
    redirect_to properties_path, notice: 'Email sent!'
  end

  def destroy
    @property.destroy

    redirect_to properties_path, notice: 'Property Deleted!!', status: :see_other
  end

  private

  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:name, :city, :country, :price, :status, :year, images: [])
  end

  def my_sanitizer
    params.require(:property).permit(:name, :city, :country, :price, :status, :year, images: [])
  end
end
