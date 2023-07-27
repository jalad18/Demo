class ReviewsController < ApplicationController

    def create
        @property = Property.find(params[:property_id])
        @review = @property.reviews.build(review_params)
        @review.user = current_user

        if @review.save
        redirect_to @property, notice: 'Review was successfully created.'
        else
        redirect_to @property, alert: 'Failed to create the review.'
        end
    end

    # def edit
    #     @review = Review.find(params[:id])
    # end
    
    # def update
    #     @review = Review.find(params[:id])
    
    #     if @review.update(review_params)
    #       redirect_to @review
    #     else
    #       render :edit, status: :unprocessable_entity
    #     end
    # end



    def destroy
        @property = Property.find(params[:property_id])
        @review = @property.reviews.find(params[:id])
        @review.destroy
        redirect_to property_path(@property), status: :see_other
    end


    private
    def review_params
        params.require(:review).permit(:name, :body)
    end
end
