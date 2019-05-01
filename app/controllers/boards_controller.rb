class BoardsController < ApplicationController

    def index
        @boards = Board.all

    end

    def new
        @board =  Board.new

    end

    def create
        @board = Board.new(board_params)
        @board.user_id = current_user.id
        if @board.save
            flash[:success] = t 'boards.flash.success'
            redirect_to boards_path
        else
            flash[:danger] = t 'boards.flash.danger'
            render :new
        end

    end

    def destroy

    end

    def edit

    end

    private
    def board_params
        params.require(:board).permit(:title, :content, :image)
    end
end
