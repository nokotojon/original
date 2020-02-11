class AddSongIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :song_id, :string
    add_column :comments, :integer, :string
  end
end
