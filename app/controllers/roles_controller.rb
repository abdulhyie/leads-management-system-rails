class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def destroy
    @role = Role.find(params[:id])
    @role.destroy
    flash[:notice] = "Role has successfully been deleted!"

    redirect_to roles_path
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(strip_role_params)
    if @role.save
      flash[:notice] = "New role has successfully been added!"
      redirect_to roles_path
    else
      flash[:alert] = "New role couldn't be added"
      render :new
    end
  end

  def user_roles
    @user_roles = UserRole.all
  end

  def destroy_user_role
    @user_role = UserRole.find(params[:id])
    @user_role.destroy
    flash[:notice] = "Assignment has successfully been deleted"

    redirect_to user_roles_path
  end

  private
  def strip_role_params
    params.require(:role).permit(:role_name)
  end
end
