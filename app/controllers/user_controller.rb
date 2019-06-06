class UserController < ApplicationController
    def show
        @user = User.find(params[:id])
        @user_comment = @user.comments.build;
    end 
end
