class CreatePokemonTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemonteams do |t|
      t.refrences :pokemons
      t.refrences :teams

      t.timestamps null: false
  end
end
