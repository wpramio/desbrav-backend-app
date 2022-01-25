class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :contact_event, null: false, foreign_key: true
      t.string :order_type
      t.string :status

      t.timestamps
    end
  end
end
