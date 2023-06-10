class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show   
  end


  private

  def topic_params
    params.require(:topic).permit(:topic_title, :topic_content).merge(user_id: current_user.id)
  end

end
