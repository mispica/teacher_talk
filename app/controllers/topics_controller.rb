class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

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

  def edit
    if current_user.id != @topic.user_id
      redirect_to root_path
    end
  end

  def update
    if @topic.update_attributes(topic_params)
      redirect_to topic_path(@topic.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @topic.user_id
       @topic.destroy
       redirect_to root_path
    else
      render :show
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:topic_title, :topic_content).merge(user_id: current_user.id)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

end
