class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :name
      t.integer :quantity
      t.decimal :total_price
      t.boolean :ordered, default: false
      t.belongs_to :user
      t.belongs_to :product



      t.timestamps
    end
  end
end
