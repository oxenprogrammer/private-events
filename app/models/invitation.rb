class Invitation < ApplicationRecord
  belongs_to :invitee, class_name: 'User', foreign_key: 'invitee_id'
  belongs_to :event, class_name: 'Event', foreign_key: 'event_id'

  def self.list_invitees(event)
    where(event_id: event.id)
      .pluck(:invitee_id)
  end

  def self.name_invitees(list)
    User.where({ id: list })
      .pluck(:name)
  end

  def self.list_past_invitations(user)
    Event.past_events.where({ id: where(invitee_id: user.id) })
      .pluck(:title, :id)
  end

  def self.list_upcoming_invitations(user)
    Event.upcoming_events.where({ id: where(invitee_id: user.id) })
      .pluck(:title, :id)
  end
end
