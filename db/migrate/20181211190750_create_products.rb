class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :title
      t.string :description
      t.string :image
      t.string :price
      t.string :quantity
      t.string :sku
      t.string :cost
      t.string :weight
      t.belongs_to :seller

      t.timestamps
    end
  end
end
