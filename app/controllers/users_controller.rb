# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users_with_properties = User.includes(:properties).where.not(properties: { id: nil })
  end

  # def contact_now
  #   user = current_user
  #   property = Property.find(params[:property_id])
  #   ContactMailer.contact_email(user, property).deliver_now
  #   redirect_to users_path, notice: 'Email sent!'
  # end

  def show
    @user = User.find(params[:id])
    @users = User.all_except(current_user)

    @room = Room.new
    @rooms = Room.public_rooms
    @room_name = get_name(@user, current_user)
    @single_room = Room.where(name: @room_name).first || Room.create_private_room([@user, current_user], @room_name)

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)
    render 'rooms/index'
  end

  private

  def get_name(user1, user2)
    user = [user1, user2].sort
    "private_#{user[0].id}_#{user[1].id}"
  end
end
