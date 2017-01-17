class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :string
      t.string :adress
      t.string :string
      t.string :phone_number
      t.string :string
      t.string :email_address
      t.string :stringContact

      t.timestamps
    end
  end
end
