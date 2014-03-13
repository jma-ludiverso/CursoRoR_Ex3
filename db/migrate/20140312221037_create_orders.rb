class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :order_status
      t.string :payment_method
      t.string :delivery_address
      t.string :delivery_city
      t.string :customer_name
      t.string :customer_surname

      t.timestamps
    end
  end
end
