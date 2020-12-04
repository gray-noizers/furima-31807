class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :item_find

    def index
        if @items.user != current_user && @items.order == nil
            @log = Log.new
        else
            redirect_to root_path
        end
    end

    def create
        @log = Log.new(log_params)
        if @log.valid?
            Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
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
        params.require(:log).permit(:postal_code, :prefecture_id, :city, :banchi, :building, :tel).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
    end

    def item_find
        @items = Item.find( params[:item_id])
    end

end
