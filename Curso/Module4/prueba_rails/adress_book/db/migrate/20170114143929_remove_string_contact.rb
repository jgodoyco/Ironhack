class RemoveStringContact < ActiveRecord::Migration[5.0]
  def change
  	remove_column :contacts, :stringContact
  end
end
