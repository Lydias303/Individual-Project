class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :display_name
      t.string :uri

      t.timestamps null: false
    end
  end
end
