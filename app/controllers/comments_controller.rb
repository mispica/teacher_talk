class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to "/topics/#{@comment.topic.id}"
    else
      flash[:alert] = "コメントを入力してください"
      redirect_to "/topics/#{@comment.topic.id}"
    end
  end 

  def destroy
    @comment = Comment.find(params[:id])
    if current_user.id == @comment.user_id
      @comment.destroy
      redirect_to root_path
    else
      redirect_to "/topics/#{@comment.topic.id}"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment_content).merge(user_id: current_user.id, topic_id: params[:topic_id])
  end

end
