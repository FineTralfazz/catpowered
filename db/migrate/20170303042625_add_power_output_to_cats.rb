class AddPowerOutputToCats < ActiveRecord::Migration[5.0]
  def change
    add_column :cats, :power_output, :integer
  end
end
