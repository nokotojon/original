class RemoveSnsAccountFromRappers < ActiveRecord::Migration[5.2]
  def change
    remove_column :rappers, :sns_account, :string
  end
end
