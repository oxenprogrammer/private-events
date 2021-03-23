class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @creator = User.find(@event.creator_id)
  end

  def create
    @event = Event.new(event_params)
    @user = User.find(current_user.id)

    puts current_user.events.build

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
