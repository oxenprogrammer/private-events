class Invitation < ApplicationRecord
  belongs_to :invitee, class_name: 'User', foreign_key: 'invitee_id'
  belongs_to :event, class_name: 'Event', foreign_key: 'event_id'
end
