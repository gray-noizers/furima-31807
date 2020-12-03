class OrdersController < ApplicationController
    before_action :item_find

    def index
        @log = Log.new
    end

    def create
        @log = Log.new(log_params)
        if @log.valid?
            @log.save
            redirect_to root_path
        else
            render action: :index
        end
    end

    private
    def log_params
        params.permit(:postal_code, :prefecture_id, :city, :banchi, :building, :tel)
    end

    def item_find
        @items = Item.find( params[:item_id])
    end
end
