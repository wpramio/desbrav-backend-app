class CreateContactEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :contact_events do |t|
      t.string :contact_type
      t.references :internal_contact, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.references :representative, null: false, foreign_key: { to_table: :users }
      t.datetime :occurred_at

      t.timestamps
    end
  end
end
