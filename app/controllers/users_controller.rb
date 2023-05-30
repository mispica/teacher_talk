class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
  end

  def edit
  end

  def update
    current_user.update(user_params)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "アカウントを削除しました"
    redirect_to root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :age_id, :subject_id, :prefecture_id, :operation_id, :schooltype_id, :school_name)
  end
end
