class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :store_link
      t.integer :cosplay_id
    end
  end
end
