class ItemsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit]

    def index
        @items = Item.all.order("created_at DESC")
    end
    
    def new
        @items = Item.new
    end

    def create
        @items = Item.new(items_params)
        if @items.save
            redirect_to root_path
        else
            render :new
        end
    end

    def show
        @items = Item.find(params[:id])
    end

    def edit
        @items = Item.find(params[:id])
        if @items.user == current_user
            render :edit
        else
            redirect_to root_path
        end
    end

    def update
        @items = Item.find(params[:id])
        if @items.update(items_params)
            redirect_to root_path
        else
            render :edit
        end
    end

    private

    def items_params
        params.require(:item).permit(:image, :title, :intro, :category_id, :condition_id, :delivery_id, :prefecture_id, :daycount_id, :price ).merge(user_id: current_user.id)
    end

end
