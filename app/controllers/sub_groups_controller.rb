class SubGroupsController < ApplicationController

  def new
    @activity = Activity.find(params[:activity_id])
    @sub_group = @activity.sub_groups.new
    # Si vous avez besoin d'initialiser des tarifications ici, ajoutez cette ligne :
  # @sub_group.tarifications.build
  end

  def create
    @activity = Activity.find(params[:activity_id])
    @sub_group = @activity.sub_groups.new(sub_group_params)
    if @sub_group.save
      # En cas de succès, redirigez vers une page pertinente, par exemple la page de l'activité
      redirect_to activity_path(@activity), notice: 'Le sous-groupe a été créé avec succès.'
    else
      # En cas d'échec, affichez de nouveau le formulaire avec les erreurs
      render :new
    end
  end

  def edit
    @activity = Activity.find(params[:activity_id]) # Assurez-vous que l'ID de l'activity est passé correctement
    @sub_group = @activity.sub_groups.find(params[:id]) # Réc
  end

  def update
    @sub_group = SubGroup.find(params[:id])
    if @sub_group.update(sub_group_params)
      redirect_to activity_path(@sub_group.activity), notice: 'SubGroup updated successfully.'
    else
      render :edit
    end
  end

  def delete
  end

  def destroy
    @activity = Activity.find(params[:activity_id])
    @sub_group = @activity.sub_groups.find(params[:id])
    @sub_group.destroy
    redirect_to activity_path(@activity), status: :see_other
  end

  private

  def sub_group_params
    params.require(:sub_group).permit(
      :activity_id,
      :name, :min_price_cents, :max_price, :recurrence, :class_type, :short_description, :subscription_by_recurrence_price,
      tarifications_attributes: [:id, :_destroy, :amount, :recurrence, :label, :description]
    )
  end
end
