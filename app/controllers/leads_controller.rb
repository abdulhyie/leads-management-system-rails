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

  private
  def strip_lead_parameters
    params.require(:lead).permit(:project_name, :client_name, :client_email, :client_contact, :client_address, :platform, :status, :user_id)
  end
end
