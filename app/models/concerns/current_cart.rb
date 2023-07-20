module CurrentCart
    private
    def set_favorite
        @favorite = Favorite.find(session[:favorite_id])
        rescue ActiveRecord::RecordNotFound
        @favorite = Favorite.create

        session[:favorite_id]=@favorite.id      
    end
end