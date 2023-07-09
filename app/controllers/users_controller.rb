class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @name = @user.name
    @topics = @user.topics
  end

  def edit
    if current_user.id != @user.id
      redirect_to user_path(@user.id)
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :age_id, :subject_id, :prefecture_id, :operation_id, :schooltype_id, :school_name)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
