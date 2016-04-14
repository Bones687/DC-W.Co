class ChangeAdminColumn < ActiveRecord::Migration
  def change
  	change_column_default(:users, :admin, 0)
  end
end
