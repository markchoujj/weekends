class CreatePremiseDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :premise_drinks do |t|
      t.references :premise, foreign_key: true
      t.references :drink, foreign_key: true
      t.decimal :price, precision: 10, scale: 4
      t.boolean :in_stock
      t.integer :amount
      t.boolean :on_sale

      t.timestamps
    end
  end
end
