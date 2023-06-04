class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @user = user
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to user_path(@user.id)
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(user.id)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
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
end
