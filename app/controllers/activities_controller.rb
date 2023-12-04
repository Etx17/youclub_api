class ActivitiesController < ApplicationController
  include Pundit::Authorization
  before_action :set_breadcrumb

  def index
  end

  def new
    @activity = Activity.new()
    @category_options = ['Sports, activités de plein air','Culture, pratiques d’activités artistiques, culturelles', 'clubs de loisirs, relations']
    @club = Club.friendly.find(params[:club])
  end

  def show
    @activity = Activity.friendly.find(params[:id])
    @sub_groups = @activity.sub_groups
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.subcategories = "Non catégorisé" if @activity.subcategories == 'Autre'
    @activity.club = Club.friendly.find(params[:activity][:club_id])

    if @activity.save
      redirect_to activity_path(@activity)
    else
      render :new
    end
  end

  def edit
    @activity = Activity.friendly.find(params[:id])
    authorize @activity
    @category_options = ['Sports, activités de plein air','Culture, pratiques d’activités artistiques, culturelles']
    @activity.trainers.build if @activity.trainers.empty?
  end

  def update

    @activity = Activity.friendly.find(params[:id])
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

  def set_breadcrumb
    add_breadcrumb 'Accueil ', :root_path

    case action_name
    when 'new', 'create'
      @club = Club.friendly.find(params[:club]) if params[:club]
      add_breadcrumb 'Nouvelle activité', new_activity_path(club_id: @club&.id)
    when 'show', 'edit', 'update'
      @activity = Activity.friendly.find(params[:id])
      add_breadcrumb @activity.name, activity_path(@activity)
      add_breadcrumb 'Modifier', edit_activity_path(@activity) if %w[edit update].include?(action_name)
    end
  end


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
      :geo_point,
      :photos,
      trainers_attributes: [:id, :_destroy, :name, :bio, :photo],
    )
  end

end
