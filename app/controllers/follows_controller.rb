class FollowsController < ApplicationController

    def create
        follow = Follow.create(user_id: current_user.id, board_id: params[:board_id])
        @board = Board.find_by(id: params[:board_id])
        if follow
            # redirect_back(fallback_location: root_path)
        else
            # redirect_back(fallback_location: root_path)
        end
    end


    def destroy
        follow = Follow.find_by(user_id: current_user.id, board_id: params[:board_id])
        @board = Board.find_by(id: params[:board_id])
        if follow.destroy  
            # redirect_back(fallback_location: root_path)
        else
            # redirect_back(fallback_location: root_path)
        end
    end

    def index
        user = current_user
        @boards = Board.followed_boards(user).page(params[:page]).per(10).order('created_at DESC')
    end
end
