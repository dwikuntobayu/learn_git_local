class RenameTypeFromMotorCycles < ActiveRecord::Migration
  def change
    rename_column :employees, :addresses, :address
    rename_column :motor_cycles, :type, :brands
  end
end
