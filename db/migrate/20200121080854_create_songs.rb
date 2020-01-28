class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :user_id
      t.string :title
      t.string :video
      t.string :lyrics
      t.string :fdate
      t.string :udate

      t.timestamps
    end
  end
end
