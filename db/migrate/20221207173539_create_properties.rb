class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.belongs_to :owner, null: false, foreign_key: true
      t.string :location
      t.string :description
      t.integer :price
      t.string :image
     
      
      t.timestamps
    end
  end
end
