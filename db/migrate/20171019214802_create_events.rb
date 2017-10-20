class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.integer :registered_application_id

      t.timestamps
    end
    add_index :events, :registered_application_id
  end
end
