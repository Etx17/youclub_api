class SubGroupsController < ApplicationController
  def edit
  end

  def update
  end

  def delete
  end

  def destroy
    @sub_group = SubGroup.find(params[:id])
    @sub_group.destroy
    redirect_to activity_path(@sub_group.activity), status: :see_other
  end

  private

  def sub_group_params
    params.require(:sub_group).permit(

    )
  end
end
