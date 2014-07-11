class CreateCommentWalls < ActiveRecord::Migration
  def change
    create_table :comment_walls do |t|
      t.text :body
      t.references :user
      t.references :user_profile

      t.timestamps
    end
    add_index :comment_walls, :user_id
    add_index :comment_walls, :user_profile_id
  end
end
