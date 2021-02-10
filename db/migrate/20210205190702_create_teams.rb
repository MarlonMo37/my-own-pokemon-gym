class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :type
      t.string :name
      t.refrences :trainer, foreign_key: {to_table: :users, on_delete: :cascade}
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
