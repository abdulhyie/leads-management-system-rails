class ProjectsController < ApplicationController

  def index
    @projects = ProjectLead.all
  end

end
