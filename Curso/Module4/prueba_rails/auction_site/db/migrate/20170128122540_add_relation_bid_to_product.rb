class AddRelationBidToProduct < ActiveRecord::Migration[5.0]
  def change
  	add_reference :bids, :products, index: true
  end
end
