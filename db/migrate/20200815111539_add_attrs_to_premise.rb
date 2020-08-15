class AddAttrsToPremise < ActiveRecord::Migration[5.2]
  def change
    add_column :premises, :inside, :integer
    add_column :premises, :available, :integer
  end
end
