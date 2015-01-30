class CommentsController < ApplicationController
	# before_action :user_authorized?

  def create
    @vacation = Vacation.find(params[:vacation_id])
    # @user = User.find(params([:username])
    @comment = Comment.create(comment_params)
    @comment.user_id = current_user.id
    @comment.vacation_id = @vacation.id

		if @comment.save
			redirect_to vacation_path(@vacation)
		else
			redirect_to vacation_path#(@vacation)
		end  	
  end

  # def new
  #   @comment= Vacation.comments.build
    
  # end

  def destroy
  	comment_find
  	@comment = Comment.delete
  	redirect_to vacation_path
  	
  end

 private
  def comment_params
  	params.require(:comment).permit(:body, :user_id, :vacation_id)
  end
end
