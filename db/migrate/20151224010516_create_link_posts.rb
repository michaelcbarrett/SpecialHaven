class CreateLinkPosts < ActiveRecord::Migration
  def change
    create_table :link_posts do |t|

      t.timestamps null: false
    end
  end
end
