class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :ref_code
      t.string :description
      t.references :product_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
