class CreateRegisteredApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :registered_applications do |t|
      t.string :name
      t.string :url
      t.integer :user_id

      t.timestamps
    end
    add_index :registered_applications, :user_id
  end
end
