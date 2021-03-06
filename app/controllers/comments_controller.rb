class CommentsController < ApplicationController
    def create
        @comment = Comment.new(comment_params) 
        if @comment.save
            redirect_to item_path(@comment.item_id)
        else
            @items = Item.find(params[:item_id])
            render "items/show.html.erb"
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
    end
end
