# frozen_string_literal: true

class ContactNowController < ApplicationController
  def contact_now
    @property = Property.find(params[:id])
    ContactNowMailer.contact_now_email(current_user, @property).deliver_now
    redirect_to @property, notice: 'Contact email sent successfully!'
  end
end
