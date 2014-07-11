class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :firstname
      t.string :lastname
      t.text :description
      t.string :job
      t.boolean :gender
      t.date :birthday
      t.string :avatar
      t.references :user

      t.timestamps
    end
    add_index :user_profiles, :user_id
  end
end
