class ItemsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @items = Item.all
    end
    
    def new
        @items = Item.new
    end

    def create
        @items = Item.new(items_params)
        if @items.save
            redirect_to root_path
        else
            render new_item_path
        end
    end

    private

    def items_params
        params.require(:item).permit(:image, :title, :intro, :category_id, :condition_id, :delivery_id, :prefecture_id, :daycount_id, :price, :user_id).merge(user_id: current_user.id)
    end

end
