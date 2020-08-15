class AddCloseTimeToPremises < ActiveRecord::Migration[5.2]
  def change
    add_column :premises, :close_time, :integer
  end
end
