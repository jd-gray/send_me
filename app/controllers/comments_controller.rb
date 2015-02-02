class CommentsController < ApplicationController
	# before_action :user_authorized?

  def create
    @vacation = Vacation.find(params[:vacation_id])
    @comment = Comment.create(comment_params)
    @comment.user_id = current_user.id
    @comment.vacation_id = @vacation.id

		if @comment.save
			redirect_to vacation_path(@vacation)
		else
			redirect_to vacation_path(@vacation)
		end  	
  end

  def destroy
    @vacation = Vacation.find(params[:vacation_id])
    @comment = @vacation.comments.find(params[:id])
    @comment.destroy
  	redirect_to vacation_path 	
  end

 private
  def comment_params
  	params.require(:comment).permit(:body, :user_id, :vacation_id)
  end
end
