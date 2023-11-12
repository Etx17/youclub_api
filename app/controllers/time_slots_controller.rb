class TimeSlotsController < ApplicationController

  def delete
  end

  def destroy
    @time_slot = TimeSlot.find(params[:id])
    @time_slot.destroy
  end

end
