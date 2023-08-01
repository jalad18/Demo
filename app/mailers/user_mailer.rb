# frozen_string_literal: true

# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Our Application!')
  end

  def button_click_email(user)
    @user = user
    mail(to: @user.email, subject: 'Button Click Email')
  end
  # def button_click_email(user, property_owner)
  #   @user = user
  #   @property_owner = property_owner
  #   mail(to: @property_owner.email, subject: 'Button Click Email')
  # end
end
