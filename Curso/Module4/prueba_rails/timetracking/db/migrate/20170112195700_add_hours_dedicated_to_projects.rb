class AddHoursDedicatedToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :hours_dedicated, :integer
  end
end
