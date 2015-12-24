class CreateTextPosts < ActiveRecord::Migration
  def change
    create_table :text_posts do |t|

      t.timestamps null: false
    end
  end
end
