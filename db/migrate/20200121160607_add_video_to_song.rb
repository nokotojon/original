class AddVideoToSong < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :video, :string
  end
end
