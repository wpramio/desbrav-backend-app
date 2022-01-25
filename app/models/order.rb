class Order < ApplicationRecord
  belongs_to :contact_event
  has_many :items, class_name: 'OrderItem'
  has_many :products, through: :items

  scope :sample_orders, -> { where(order_type: 'sample') }
  scope :quote_orders, -> { where(order_type: 'quote') }
  scope :development_orders, -> { where(order_type: 'development') }
end
