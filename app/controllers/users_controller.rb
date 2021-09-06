class UsersController < ApplicationController

  before_action :check_user_session
  before_action :check_authorization, only: [:all_users, :new_user, :create_user, :assign_roles, :destroy_user, :create_role]

  # All Users
  def index
    @users = User.all
  end

  # Dashboard
  def home
    @users = User.all
  end

  # Add User
  def new
    @user = User.new
    @roles = Role.all
  end

  def create_user
    @user = User.new(strip_user_params)
    if @user.save
      flash[:notice] = "User created successfully!"
      redirect_to users_path
    else
      flash[:alert] = "User couldn't be created!"
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "User deleted successfully!"

    redirect_to users_path
  end

  def my_phases
    @phases = Phase.all.where(user_id: current_user.id)
  end

  def phase_requests
    @phase_reqs = current_user.phases.where(phase_status: "Awaiting Manager")
  end

  private

  def check_authorization

    if not user_is?("Super Admin")
      flash[:alert] = "You are not authorized to view this page."
      redirect_to root_path
    end

  end

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
