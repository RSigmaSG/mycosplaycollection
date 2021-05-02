class CreateCosplays < ActiveRecord::Migration[6.0]
  def change
    create_table :cosplays do |t|
      t.string :character_name
      t.string :show
      t.integer :user_id

      t.timestamps
    end
  end
end
