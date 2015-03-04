class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :display_name
      t.string :type
      t.datetime :datetime
      t.integer :age_restriction
      t.decimal :popularity
      t.string :uri
      t.integer :venue_id
      t.integer :artist_id

      t.timestamps null: false
    end
  end
end
