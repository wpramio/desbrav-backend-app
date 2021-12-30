class Client < ApplicationRecord
  belongs_to :representative, class_name: 'User', optional: true
  has_many :internal_contacts, dependent: :destroy
  has_many :contact_events
end
