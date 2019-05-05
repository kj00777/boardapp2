class CommentsController < ApplicationController

    def create
        @board = Board.find_by(id: params[:board_id])
        @comment = @board.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            @comment = Comment.new
            @comments = @board.comments.page(params[:page]).per(10).order('created_at DESC')
            #redirect_to "/boards/#{@comment.board_id}"
        else
            render "boards/show"
        end
    end

    def edit
        @board = Board.find_by(id: params[:board_id])
        @comment = Comment.find_by(id: params[:id])
    end

    def update
        @board = Board.find_by(id: params[:board_id])
        @comment = Comment.find_by(id: params[:id])
        if @comment.update(comment_params)
            @comments = @board.comments.page(params[:page]).per(10).order('created_at DESC')
        else
            render :edit
        end

    end


    def destroy
        @board = Board.find_by(id: params[:board_id])
        @comment = Comment.find_by(id: params[:id])
        if @comment.destroy
            @comments = @board.comments.page(params[:page]).per(10).order('created_at DESC')
        else
            render :edit
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
