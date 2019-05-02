class CommentsController < ApplicationController

    def create
        @board = Board.find_by(id: params[:board_id])
        @comment = @board.comments.build(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_to "/boards/#{@comment.board_id}"
        else
            render "boards/show"
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
