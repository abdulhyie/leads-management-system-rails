class PhasesController < ApplicationController

  before_action :check_user_session

  def show
    @phase = Phase.find(params[:id])
    @comments = @phase.comments.reverse
    @comment = Comment.new
  end

  def create
    @lead = Lead.find(params[:lead_id])
    @phase = @lead.phases.new(strip_phase_params)
    if @phase.save
      flash[:notice] = "Phase has been created. Email has been sent to the manager."
      AlertUsersMailer.notify_manager(@phase.user, @phase).deliver
      redirect_to lead_path(@lead)
    else
      flash[:alert] = "There was an error. Phase couldn't been added."
      redirect_to lead_path(@lead)
    end
  end

  def destroy
    @phase = Phase.find(params[:id])
    @lead_id = @phase.lead.id
    @phase.destroy
    flash[:notice] = "Phase has successfully been deleted."
    redirect_to lead_path(@lead_id)
  end

  def accept_decline
    @phase = Phase.find(params[:id])
  end

  def set_phase_status
    @phase = Phase.find(params[:id])
    @phase.update(strip_phase_params_update)
    redirect_to phase_requests_users_path
  end

  def add_engineer
    @phase = Phase.find(params[:id])
    @phase_assignment = PhaseAssignment.new
    @engineers = Role.find_by(role_name: "Engineer").user_roles
  end

  def add_multiple_engineers

  end

  def mark_complete
    @phase = Phase.find(params[:id])
    @phase.phase_status = "Complete"
    @phase.save
    flash[:notice] = "Phase has successfully been completed!"
    redirect_to lead_path(@phase.lead.id)
  end

  private
  
  def strip_phase_params
    params.require(:phase).permit(:start_date, :due_date, :user_id, :phase_type, :phase_status)
  end

  def strip_phase_params_update
    params.require(:phase).permit(:manager_comment, :phase_status)
  end

  def check_user_session
    authenticate_user!
  end
end
