class Event < ApplicationRecord
  belongs_to :event_group
  has_and_belongs_to_many :teams
end
