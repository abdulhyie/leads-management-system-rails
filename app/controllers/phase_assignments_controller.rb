class PhaseAssignmentsController < ApplicationController

  def generate_form
    @num_selects = params[:num_selects].to_i
    @phase_id = params[:phase_id]
    @engineers = Role.find_by(role_name: "Engineer").user_roles
  end

  def new

  end

  def create
    @phase_assignment = PhaseAssignment.new(strip_phase_assignment_params)
    if @phase_assignment.save
      flash[:notice] = "Engineer has successfully been assigned to the phase."
    else
      flash[:notice] = "Engineer has successfully been assigned to the phase."
    end
    redirect_to "/phase/add_engineer/" + @phase_assignment.phase.id.to_s
  end

  private
  
  def strip_phase_assignment_params
    return params.require(:phase_assignment).permit(:phase_id, :user_id)
  end

end
