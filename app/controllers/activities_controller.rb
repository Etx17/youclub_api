class ActivitiesController < ApplicationController
  def index
  end

  def new
    @activity = Activity.new()
  end

  def show
    @activity = Activity.find(params[:id])
    @sub_groups = @activity.sub_groups
  end

  def create
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update(activity_params)
      redirect_to edit_activity_path(@activity), notice: 'Activity was successfully updated.'
    else
      render :edit
    end
  end

  def delete
  end

  private

  def activity_params
    params.require(:activity).permit(
      :name,
      :geo_point,
      :category,
      :address,
      :actual_zipcode,
      :free_trial,
      :is_looking_for_volunteer,
      :subcategories,
      :recurrence,
      :subscription_link,
      :short_description,
      :full_description,
      :club_id,
      :images, # Assuming `images` is an array of image data
      :category_number,
      :subcategory_number,
      :phone_number,
      :photos
    )
  end

end
