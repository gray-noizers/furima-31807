class CommentsController < ApplicationController
    def create
        if comment = Comment.create(comment_params) 
            redirect_to "/items/#{comment.item.id}"
        else
            render "/items/#{comment.item.id}"
        end
    end

    private
    def comment_params
        params.permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
    end
end
