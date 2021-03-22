module EventsHelper
  def event_errors_messages
    render 'display_event' if @event.errors.any?
  end
end
