class AddRelationToComments < ActiveRecord::Migration[5.0]
  def change
  	add_reference :comments, :movies, index: true
  end
end
