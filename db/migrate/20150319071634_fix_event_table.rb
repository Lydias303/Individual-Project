class FixEventTable < ActiveRecord::Migration
  def change
    add_column :events, :show_name, :string
    add_column :events, :artist, :string
    add_column :events, :date, :string
    remove_column :events, :venue_id, :integer
    remove_column :events, :artist_id, :integer
  end
end
