class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :title
      t.string :description
      t.decimal :price
      t.integer :quantity
      t.integer :sku
      t.decimal :cost
      t.decimal :weight
      t.belongs_to :seller

      t.timestamps
    end
  end
end
