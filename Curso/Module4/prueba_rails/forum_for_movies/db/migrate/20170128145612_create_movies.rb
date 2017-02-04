class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.text :title
      t.binary :poster
      t.integer :year
      t.text :sypnosis

      t.timestamps
    end
  end
end
