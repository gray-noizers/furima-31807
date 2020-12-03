class OrdersController < ApplicationController
    before_action :item_find

    def index
        @log = Log.new
    end

    def create
        @log = Log.new(log_params)
        if @log.valid?
            Payjp.api_key = "sk_test_fdaa8efebb1b2c879c51163c"
            Payjp::Charge.create(
                amount: @items.price,
                card: log_params[:token],
                currency: 'jpy'
            )
            @log.save
            redirect_to root_path
        else
            render action: :index
        end
    end

    private
    def log_params
        params.permit(:postal_code, :prefecture_id, :city, :banchi, :building, :tel, :item_id).merge(token: params[:token], user_id: current_user.id)
    end

    def item_find
        @items = Item.find( params[:item_id])
    end

end
