class RsvpsController < ApplicationController
  def create
    @rsvp = Rsvp.new(params.require(:rsvp).permit(:user_id, :event_id))
    @rsvp.save

    # flash[:msg] = @ride.take_ride
    redirect_to user_path(current_user)
  end
end
