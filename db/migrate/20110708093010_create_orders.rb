class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :buyer_id
      t.integer :total
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
