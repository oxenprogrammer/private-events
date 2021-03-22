class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :invitations
  has_many :invitees, through: :invitations, source: :invitee

  before_save { self.desc = desc.downcase }
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :desc, presence: true, length: { minimum: 20, maximum: 300 }
  validates :event_date, presence: true
end
