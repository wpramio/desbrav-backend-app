class ContactEvent < ApplicationRecord
  belongs_to :internal_contact
  belongs_to :client
  belongs_to :representative, class_name: 'User'
end
