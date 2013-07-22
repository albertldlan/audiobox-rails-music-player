class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :description
      t.string :direct_upload_url
      t.references :user

      t.timestamps
    end
    add_index :songs, :user_id
  end
end
