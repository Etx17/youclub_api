class ActivitiesController < ApplicationController
  def index
  end

  def new
  end

  def show
    @activity = Activity.find(params[:id])
    @sub_groups = @activity.sub_groups
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end
end
