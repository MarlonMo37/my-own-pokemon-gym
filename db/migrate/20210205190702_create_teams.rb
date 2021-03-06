class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.references :trainer, foreign_key: {to_table: :users, on_delete: :cascade}

      t.timestamps null: false
    end
  end
end
