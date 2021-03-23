module EventsHelper
  def event_errors_messages
    render 'display_event' if @event.errors.any?
  end

  def list_past_events(events)
    if events.empty?
      'There are no past events.'
    else
      content_tag :ul, class: 'd-flex flex-column' do
        events.collect { |event| concat link_to event[0], event_path(event[1]) }
      end
    end
  end

  def list_upcoming_events(events)
    if events.empty?
      'There are no upcoming events'
    else
      content_tag :ul, class: 'd-flex flex-column' do
        events.collect { |event| concat link_to event[0], event_path(event[1]) }
      end
    end
  end
end
