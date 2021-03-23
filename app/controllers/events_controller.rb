class EventsController < ApplicationController
  def index
    @past_events = Event.find_past_events
    @upcoming_events = Event.find_upcoming_events
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @creator = User.find(@event.creator_id)
    @event_invitees = Invitation.list_invitees(@event)
    @invitees = Invitation.name_invitees(@event_invitees)
  end

  def create
    @event = Event.new(event_params)
    @user = User.find(current_user.id)

    @event.creator_id = @user.id
    if @event.save
      redirect_to @user
    else
      render :new
    end
  end

  def event_params
    params.require(:event).permit(:title, :desc, :venue, :event_date)
  end

  private :event_params
end
