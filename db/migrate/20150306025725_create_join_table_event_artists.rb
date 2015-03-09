class CreateJoinTableEventArtists < ActiveRecord::Migration
  def change
    create_join_table :events, :artists do |t|
       t.index [:event_id, :artist_id]
       t.index [:artist_id, :event_id]
    end
  end
end
