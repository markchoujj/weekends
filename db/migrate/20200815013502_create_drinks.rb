class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :volume
      t.integer :age
      t.string :brand
      t.integer :type
      t.decimal :advice_price, precision: 10, scale: 4

      t.timestamps
    end
  end
end
