class InternalContact < ApplicationRecord
  belongs_to :client
  has_many :contact_events
end
