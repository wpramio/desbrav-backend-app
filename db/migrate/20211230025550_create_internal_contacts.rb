class CreateInternalContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :internal_contacts do |t|
      t.string :name
      t.string :email
      t.string :role
      t.string :phone
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
