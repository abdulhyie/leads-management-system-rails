class LeadsController < ApplicationController
  def index
    @leads = Lead.all
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(strip_lead_parameters)
    if @lead.save
      flash[:notice] = "Lead was successfully started!"
      redirect_to leads_path
    else
      flash[:alert] = "Error! Couldn't start the lead!"
      render :new
    end
  end

  def destroy
    @lead = Lead.find(params[:id])
    @lead.destroy
    flash[:notice] = "Lead was deleted successfully"
    redirect_to leads_path
  end

  def show
    @lead = Lead.find(params[:id])
    @phases = @lead.phases.reverse
    @comment_size = 0
    @user_size = 0
    @lead.phases.each do |phase|
      @comment_size = @comment_size + phase.comments.size
    end
    @phases.each do |phase|
      @user_size = @user_size + phase.phase_assignments.size
    end
    @phase = Phase.new
    @managers = Role.find_by(role_name: "Technical Manager").user_roles
  end

  def mark_complete
    @lead = Lead.find(params[:id])
    if @lead.phases.where.not(phase_status: "Complete").size > 0
      flash[:alert] = "This lead has incomplete phases. Complete all phases to start transitioning to sale"
    else
      @lead.status = "Complete"
      @lead.save
      flash[:notice] = "Lead has successfully been completed."
    end
    redirect_to lead_path(params[:id])
  end

  private
  def strip_lead_parameters
    params.require(:lead).permit(:project_name, :client_name, :client_email, :client_contact, :client_address, :platform, :status, :user_id)
  end
end
