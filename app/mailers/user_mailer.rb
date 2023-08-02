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

  # def contact_email(user, property)
  #   @user = user
  #   @property = property
  #   mail(to: @user.email, subject: "Contact Now: #{property.name}")
  # end
end
