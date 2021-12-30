class User < ApplicationRecord
  has_secure_password

  has_many :clients, foreign_key: 'representative_id', dependent: :nullify
  has_many :contact_events, foreign_key: 'representative_id'
end
