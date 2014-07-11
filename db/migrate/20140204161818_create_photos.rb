class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.text :info
      t.references :category
      t.references :user

      t.timestamps
    end
    add_index :photos, :category_id
    add_index :photos, :user_id
  end
end
