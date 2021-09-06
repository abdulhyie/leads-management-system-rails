class UserRolesController < ApplicationController

  def index
    @user_roles = UserRole.all
  end

  def new
    @user_role = UserRole.new
    @users = User.all
    @roles = Role.all
  end

  def create
    @user_role = UserRole.new(strip_user_role_params)
    if @user_role.save
      flash[:notice] = "User has successfully been assigned the role!"
      redirect_to user_roles_path
    else
      flash[:alert] = "Error! Couldn't assign role"
      render :assign_roles
    end
  end

  def destroy
    @user_role = UserRole.find(params[:id])
    @user_role.destroy
    flash[:notice] = "Assignment has successfully been deleted"

    redirect_to user_roles_path
  end

  private

  def strip_user_role_params
    params.require(:user_role).permit(:user_id, :role_id)
  end

end
