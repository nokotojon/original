class AddDetailsToRappers < ActiveRecord::Migration[5.2]
  def change
    add_column :rappers, :twitter, :string
    add_column :rappers, :youtube, :string
  end
end
