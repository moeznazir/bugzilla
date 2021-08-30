class StatusesController < ApplicationController
  def new
    @status = Status.new
    @bug = Bug.all
  end
  def create
    @status = Status.new(status_params)
    if @status.save
      flash[:success] = "Comment is succefully saved"
    else
      render :new
    end
  end
  private
    def status_params
      params.require(:status).permit(:coment, :bug_id)
    end
  
end