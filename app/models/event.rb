class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :invitations
  has_many :invitees, through: :invitations, source: :invitee

  before_save { self.desc = desc.downcase }
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :desc, presence: true, length: { minimum: 20, maximum: 300 }
  validates :event_date, presence: true

  scope :past_events, -> { where('event_date < ?', DateTime.now) }
  scope :upcoming_events, -> { where('event_date > ?', DateTime.now) }

  def self.find_upcoming_events
    upcoming_events.order('created_at DESC').pluck(:title, :id)
  end

  def self.find_past_events
    past_events.order('created_at DESC').pluck(:title, :id)
  end
end
