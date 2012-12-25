class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.integer :user_id

      t.timestamps
    end

    add_foreign_key :events, :users, :column => 'user_id', :name => 'events_user_fk'
  end
end
