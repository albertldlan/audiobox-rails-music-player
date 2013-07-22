class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :comment
      t.integer :time
      t.references :user
      t.references :song

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :song_id
  end
end
