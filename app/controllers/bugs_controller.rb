class BugsController < ApplicationController
  
  def index
    @user = User.all
    if current_user.user_role == "Manager"
      @bug = Bug.all
    else 
        if current_user.user_role == "Q/A"
          @bug = Bug.where(user_id:current_user.id)
        else
          @bug = Bug.where(assigned_to:current_user.user_name)
        end
    end
  end
  def new
    if current_user.user_role == "Manager" || "Q/A"
      @bug = Bug.new
      @user = User.where(user_role: ["Q/A", "Developer"])
    else
      @status = Status.new
    end
  end
  def create 
    if current_user.user_role == "Manager"
      @bug = Bug.new(bug_params_manager)
    else
      @bug = Bug.new(bug_params_qa)
    end
    if @bug.save
      flash[:success] = "Bug is successfully created"
      redirect_to bugs_path
    else
      render :new
    end

    

  end

  def edit
    @bug = Bug.find(params[:id])
  end
  def update
    @bug = Bug.find(params[:id])
    if current_user.user_role == "Manager"
      @bug.update(bug_params_manager)
    else
      @bug.update(bug_params_qa)
    end
    if @bug.save
      flash[:success] = "Bug is successfully updated"
      redirect_to bugs_path
    else
      render :new
    end
  end
  def show
    @bug = Bug.find(params[:id])
    @user = User.all
  end
  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy
  end
private
  def bug_params_manager
    params.require(:bug).permit(:title, :description, :priority, :assigned_to, :estimated_day_for_completion, :user_id) 
  end
  def bug_params_qa
    params.require(:bug).permit(:title, :description, :priority, :estimated_day_for_completion, :user_id) 
  end
 
end
