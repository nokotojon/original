class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :user_id
      t.string :title
      t.string :lyric
      t.string :video

      t.timestamps
    end
  end
end
