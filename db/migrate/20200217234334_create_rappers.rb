class CreateRappers < ActiveRecord::Migration[5.2]
  def change
    create_table :rappers do |t|
      t.string :name
      t.string :furigana_name
      t.string :represent_area
      t.string :crew
      t.string :sns_account
      t.string :introduction
      t.string :image
      
      t.integer :vote
      t.integer :age
      t.integer :rhyme
      t.integer :flow
      t.integer :talk
      t.integer :props
      t.integer :synthesis
      t.timestamps
    end
  end
end
