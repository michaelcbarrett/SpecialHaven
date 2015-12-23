class CreateVideoPosts < ActiveRecord::Migration
  def change
    create_table :video_posts do |t|

      t.timestamps null: false
    end
  end
end
