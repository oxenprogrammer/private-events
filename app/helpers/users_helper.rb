module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end

  def error_messages
    render 'shared/display' if @user.errors.any?
  end

  def my_attendance(current_user_attendance)
    if current_user_attendance.any?
      content_tag :ul, class: 'd-flex flex-column' do
        current_user_attendance.collect { |event| concat link_to event.title, event_path(event.id) }
      end
    else
      'You do not have an event to attend yet'
    end
  end
end
