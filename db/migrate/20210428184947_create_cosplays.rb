class CreateCosplays < ActiveRecord::Migration[6.0]
  def change
    create_table :cosplays do |t|
      t.string :character_name
      t.string :Show
      t.integer :user_id
    end
  end
end
