class ActivitiesController < ApplicationController
  def index
  end

  def new
    @activity = Activity.new()
    @category_options = ['Sports, activités de plein air','Culture, pratiques d’activités artistiques, culturelles']
  end

  def show
    @activity = Activity.find(params[:id])
    @sub_groups = @activity.sub_groups
  end

  def create

    @activity = Activity.new(activity_params)
    @activity.subcategories = "Non catégorisé" if @activity.subcategories == 'Autre'
    @activity.club = Club.find(params[:activity][:club_id])

    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:id])
    @category_options = ['Sports, activités de plein air','Culture, pratiques d’activités artistiques, culturelles']
    @activity.trainers.build if @activity.trainers.empty?
  end

  def update

    @activity = Activity.find(params[:id])

    if params[:activity][:photos].present?
      @activity.photos.first.purge if @activity.photos.any?
      @activity.photos.attach(params[:activity][:photos])
    end

    if @activity.update(activity_params)
      redirect_to activity_path(@activity), notice: 'Activity was successfully updated.'
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
      :other_subcategory,
      :recurrence,
      :subscription_link,
      :short_description,
      :full_description,
      :club_id,
      :images, # Assuming `images` is an array of image data
      :category_number,
      :subcategory_number,
      :phone_number,
      :photos,
      trainers_attributes: [:id, :_destroy, :name, :bio, :photo],
    )
  end

end
