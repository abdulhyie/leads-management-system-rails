class UserController < ApplicationController

  before_action :check_user_session

  # Dashboard
  def index
  end

  # All Users
  def all_users
    @users = User.all
  end

  # Add User
  def new_user
    @user = User.new
    @roles = Role.all
  end

  def create_user
    @user = User.new(strip_user_params)
    if @user.save
      flash[:notice] = "User created successfully!"
      redirect_to all_users_path
    else
      flash[:alert] = "User couldn't be created!"
      render :new_user
    end
  end

  def destroy_user
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User deleted successfully!"

    redirect_to all_users_path
  end

  def assign_roles
    @user_role = UserRole.new
    @users = User.all
    @roles = Role.all
  end

  def create_role
    @user_role = UserRole.new(strip_user_role_params)
    if @user_role.save
      flash[:notice] = "User has successfully been assigned the role!"
      redirect_to assign_roles_path
    else
      flash[:alert] = "Error! Couldn't assign role"
      render :assign_roles
    end
  end

  def my_phases
    @phases = Phase.all.where(user_id: current_user.id)
  end

  private

  def check_user_session
    authenticate_user!
    # if not user_signed_in?
    #   redirect_to "devise/sessions/new"
    #   # render "devise/sessions/new"
    # end
  end

  def strip_user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def strip_user_role_params
    params.require(:user_role).permit(:user_id, :role_id)
  end
end
