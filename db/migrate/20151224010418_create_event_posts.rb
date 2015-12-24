class CreateEventPosts < ActiveRecord::Migration
  def change
    create_table :event_posts do |t|
      t.datetime :event_start_time
      t.datetime :event_end_time
      t.string :location
      
      t.timestamps null: false
    end
  end
end
