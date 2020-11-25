class ItemsController < ApplicationController

    def index
    end
    
    def new
        @items = Item.new
    end

    def create
    end

    private
        def items_params
            params.require(:items).permit(:image).merge(user_id: current_user.id)
        end

end
