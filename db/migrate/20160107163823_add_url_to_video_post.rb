class AddUrlToVideoPost < ActiveRecord::Migration
  def change
    add_column :video_posts, :url, :string
  end
end
