class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      t.string :company_name
      t.string :production_capacity
      t.boolean :pay_for_shipping
      t.string :payment_condition
      t.references :representative, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
