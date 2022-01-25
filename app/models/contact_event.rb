class ContactEvent < ApplicationRecord
  belongs_to :internal_contact
  belongs_to :client
  belongs_to :representative, class_name: 'User'
  has_many :orders

  def sample_orders
    orders.where(order_type: 'sample')
  end

  def quote_orders
    orders.where(order_type: 'quote')
  end

  def development_orders
    orders.where(order_type: 'development')
  end
end
