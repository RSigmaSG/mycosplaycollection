class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :store_link
      t.integer :price
      t.integer :quantity
      t.integer :cosplay_id

      t.timestamps
    end
  end
end
