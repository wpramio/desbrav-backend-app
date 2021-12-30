class User < ApplicationRecord
  has_secure_password

  has_many :clients, foreign_key: 'representative_id', dependent: :nullify
end
