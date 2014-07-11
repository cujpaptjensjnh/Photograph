class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.references :following
      t.references :followee

      t.timestamps
    end
    add_index :followers, :following_id
    add_index :followers, :followee_id
  end
end
