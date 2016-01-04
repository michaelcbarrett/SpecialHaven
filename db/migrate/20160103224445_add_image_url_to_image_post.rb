class AddImageUrlToImagePost < ActiveRecord::Migration
  def change
    add_column :image_posts, :image_url, :string
  end
end
