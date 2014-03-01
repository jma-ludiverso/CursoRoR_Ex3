class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :product_name
      t.text :description
      t.datetime :added_at
      t.string :manufacturer
      t.integer :stock

      t.timestamps
    end
  end
end
