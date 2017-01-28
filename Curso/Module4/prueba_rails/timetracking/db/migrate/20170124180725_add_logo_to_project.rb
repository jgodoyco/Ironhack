class AddLogoToProject < ActiveRecord::Migration[5.0]
  def self.up
  	add_attachment :projects, :logo
  end
  def self.down
  	remove_attachment :projects, :logo
  end
end
