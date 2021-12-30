class Client < ApplicationRecord
  belongs_to :representative, class_name: 'User', optional: true
end
