class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/topics/#{@comment.topic.id}"
    else
      redirect_to "/topics/#{@comment.topic.id}", flash: { error: @comment.errors.full_messages }
    end
  end 

  private

  def comment_params
    params.require(:comment).permit(:comment_content).merge(user_id: current_user.id, topic_id: params[:topic_id])
  end

end
