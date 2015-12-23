class AddForeignKeyToPost < ActiveRecord::Migration
  def change
  	change_table :posts do |t|
  		t.actable
  	end
  end
end
