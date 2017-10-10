class Admin::ActivitiesController < AdminController
  before_action :set_user, only: [:new, :create]
  before_action :find_activity, only: [:edit, :update, :destroy, :show]

  def index
    @activities = Activity.all
  end

  def new
    @activity ||= Activity.new
    render
  end

  def create
    @activity = @user.activities.new activity_params
    if @activity.save
      redirect_to admin_activities_path, notice: 'Activity created!'
    else
      render 'new'
    end
  end

  def show() end

  def edit
    if @activity
      render
    else
      redirect_to admin_activities_path, notice: 'Activity not found!'
    end
  end

  def update
    if @activity.update activity_params
      redirect_to admin_activities_path, notice: 'Activity updated!'
    else
      render 'edit'
    end
  end

  def destroy
    if @activity.destroy
      redirect_to admin_activities_path, notice: 'Activity deleted!'
    else
      render 'index'
    end
  end

  private

    def set_user
      @user = current_user
    end

    def find_activity
      @activity = Activity.find params[:id]
      rescue ActiveRecord::RecordNotFound
        redirect_to(admin_activities_url, :notice => 'Record not found')
    end

    def activity_params
      params.require(:activity).permit(:user_id, :title, :description, :start_time, :end_time, :status)
    end
end
