class CreatePremises < ActiveRecord::Migration[5.2]
  def change
    create_table :premises do |t|
      t.string :name
      t.string :address
      t.string :post_code
      t.string :license_no
      t.string :name
      t.string :suburb
      t.decimal :latitude, precision: 10, scale: 7
      t.decimal :longitude, precision: 10, scale: 7
      t.boolean :gaming

      t.timestamps
    end
  end
end
