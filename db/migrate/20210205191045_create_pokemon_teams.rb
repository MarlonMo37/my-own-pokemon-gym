class CreatePokemonTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemonteams do |t|
      t.belongs_to :pokemon
      t.references :team

      t.timestamps null: false
    end
  end
end
