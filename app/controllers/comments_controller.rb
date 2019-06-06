class CommentsController < ApplicationController
    def create
        @user = User.find(params[:comment][:user_id])
        @user_comment = @user.comments.new(comment_params)
        if @user_comment.save
            redirect_to user_path(@user)
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:comment)
    end
end
