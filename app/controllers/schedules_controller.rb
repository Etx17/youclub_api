class SchedulesController < ApplicationController

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
    @activity = Activity.find(params[:activity_id])
    @sub_group = @activity.sub_groups.find(params[:sub_group_id])
    @schedule = @sub_group.schedules.find(params[:id])

    @schedule.destroy
    redirect_to activity_path(@activity), status: :see_other
  end
end
