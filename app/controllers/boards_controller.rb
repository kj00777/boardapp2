class BoardsController < ApplicationController

    before_action :board_user, only: [:edit, :destroy]

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

    def show
        @board = Board.find_by(id: params[:id])
        @comments = @board.comments.page(params[:page]).per(2).order('created_at DESC')
        @comment = Comment.new
    end

    def destroy
        @board = Board.find_by(id: params[:id])
        @board.destroy
        flash[:danger] = t 'boards.flash.delete' ,title: @board.title
        redirect_to boards_path

    end

    def edit
        @board = Board.find_by(id: params[:id])

    end

    def update
        @board = Board.find_by(id: params[:id])
        if @board.update(board_params)
            flash[:success] = t 'boards.flash.update'
           redirect_to boards_path 
        else
            render :edit
        end
    end

    private
    def board_params
        params.require(:board).permit(:title, :content, :image)
    end

    def board_user
        board = Board.find_by(id: params[:id])
        if board.user_id != current_user.id
            flash[:danger] = t 'boards.flash.board_user'
            redirect_to boards_path
        end
    end


end
