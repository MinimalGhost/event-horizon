class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @user = current_user
    @rsvp = Rsvp.new(user_id: @user.id, event_id: @event.id)
  end

  def create
    @event = Event.new(event_params)
    # @locations = Location.all
    if @event.valid?
      @event.save
      redirect_to event_path(@event)
    else
      flash[:error] = @event.errors.full_messages
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      flash[:error] = @event.errors.full_messages
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path
  end

  private
  def event_params
    params.require(:event).permit(:name, :date, :size, :location_id)
  end
end
