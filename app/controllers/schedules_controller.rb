class SchedulesController < ApplicationController

  def new
    @activity = Activity.find(params[:activity_id])
    @sub_group = @activity.sub_groups.find(params[:sub_group_id])
    @schedule = @sub_group.schedules.new
    @schedule.time_slots.build # Build an initial time slot for the form
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @sub_group = @activity.sub_groups.find(params[:sub_group_id])
    @schedule = @sub_group.schedules.new(schedule_params)

    if @schedule.save
      redirect_to activity_path(@activity), notice: 'Schedule was successfully created.'
    else
      render :new
    end
  end


  def edit
    @activity = Activity.find(params[:activity_id])
    @sub_group = @activity.sub_groups.find(params[:sub_group_id])
    @schedule = @sub_group.schedules.find(params[:id])

    @schedule.time_slots.build if @schedule.time_slots.empty?
  end

  def update
    @activity = Activity.find(params[:activity_id])
    @sub_group = @activity.sub_groups.find(params[:sub_group_id])
    @schedule = @sub_group.schedules.find(params[:id])
    if @schedule.update(schedule_params)
      # Redirect to the show page or wherever appropriate
      redirect_to activity_path(@activity), notice: 'Schedule was successfully updated.'
    else
      render :edit
    end
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

  private

  def schedule_params
    params.require(:schedule).permit(
      :day,
      time_slots_attributes: [:id, :_destroy, :start_time, :end_time]
    )
  end
end
