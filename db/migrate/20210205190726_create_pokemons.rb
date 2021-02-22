class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons do |t|
      t.string :name 
      t.string :nickname
      t.string :primary_type
      t.string :secondary_type
      t.string :nature
      t.string :ability 
      t.string :avatar
      t.string :sprite

      t.timestamps null: false
    end
  end
end
