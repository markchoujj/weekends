class AddHeatToPremises < ActiveRecord::Migration[5.2]
  def change
    add_column :premises, :heat, :integer
  end
end
