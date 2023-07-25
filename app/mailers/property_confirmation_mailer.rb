class PropertyConfirmationMailer < ApplicationMailer
    default from: 'jalad@gmail.com'
    def agent_confirmation(property)
        @property = property
        @agent_email = User.find_by(id: property.user_id, role: 'agent')&.email        
        mail(to: @agent_email, subject: 'Order Confirmation')
    end

    def customer_confirmation(property)
        @property = property
        @customer = User.find_by(id: @property.user_id, role: 'customer')
        @customer_email = @customer.email if @customer
        mail(to: @customer_email, subject: 'Order Confirmation')
    end
end
