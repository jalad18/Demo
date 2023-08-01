# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'jalad@gmail.com'
  layout 'mailer'
end
