class ContactNowMailer < ApplicationMailer
    def contact_now(property)
        @property = property
        @user = @property.user
        mail(to: current_user.email, subject: 'Welcome to Our Application!')
    end
end
