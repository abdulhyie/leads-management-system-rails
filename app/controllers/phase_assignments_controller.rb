class PhaseAssignmentsController < ApplicationController

  def show
    @engineers = PhaseAssignment.where(phase_id: params[:id])
  end

  def create
    @phase_assignment = PhaseAssignment.new(strip_phase_assignment_params)
    if @phase_assignment.save
      AlertUsersMailer.notify_engineer(@phase_assignment.user, @phase_assignment.phase).deliver
      flash[:notice] = "Engineer has successfully been assigned to the phase. Mail has been sent."
    else
      flash[:alert] = "Engineer could not be added to the phase."
    end
    redirect_to phase_path(@phase_assignment.phase)
  end

  def destroy
    @phase_assignment = PhaseAssignment.find(params[:id])
    @phase_id = @phase_assignment.id
    @phase_assignment.destroy
    flash[:notice] = "Engineer was removed from the phase."
    redirect_to phase_assignment_path(@phase_id)
  end

  def generate_form
    @num_selects = params[:num_selects].to_i
    @phase_id = params[:phase_id]
    @engineers = Role.find_by(role_name: "Engineer").user_roles
  end

  private
  
  def strip_phase_assignment_params
    return params.require(:phase_assignment).permit(:phase_id, :user_id)
  end

end
