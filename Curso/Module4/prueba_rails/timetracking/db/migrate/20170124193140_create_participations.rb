class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.references 	:person, index: true
      t.references 	:project, index: true
      t.timestamps
    end
  end
end
