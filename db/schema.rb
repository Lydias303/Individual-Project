ActiveRecord::Schema.define(version: 20150319021509) do

  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string   "display_name"
    t.string   "uri"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "artists_events", id: false, force: :cascade do |t|
    t.integer "event_id",  null: false
    t.integer "artist_id", null: false
  end

  add_index "artists_events", ["artist_id", "event_id"], name: "index_artists_events_on_artist_id_and_event_id", using: :btree
  add_index "artists_events", ["event_id", "artist_id"], name: "index_artists_events_on_event_id_and_artist_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "display_name"
    t.string   "event_type"
    t.datetime "datetime"
    t.integer  "age_restriction"
    t.decimal  "popularity"
    t.string   "uri"
    t.integer  "venue_id"
    t.integer  "artist_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "location"
    t.string   "city"
    t.decimal  "lng"
    t.decimal  "lat"
    t.string   "state"
    t.string   "address"
  end

  create_table "events_locations", id: false, force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "event_id",    null: false
  end

  add_index "events_locations", ["event_id", "location_id"], name: "index_events_locations_on_event_id_and_location_id", using: :btree
  add_index "events_locations", ["location_id", "event_id"], name: "index_events_locations_on_location_id_and_event_id", using: :btree

  create_table "events_users", id: false, force: :cascade do |t|
    t.integer "user_id",  null: false
    t.integer "event_id", null: false
  end

  add_index "events_users", ["event_id", "user_id"], name: "index_events_users_on_event_id_and_user_id", unique: true, using: :btree
  add_index "events_users", ["user_id", "event_id"], name: "index_events_users_on_user_id_and_event_id", unique: true, using: :btree

  create_table "locations", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "oauth_token"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string   "display_name"
    t.string   "country"
    t.string   "city"
    t.string   "zip"
    t.decimal  "lat"
    t.decimal  "lng"
    t.string   "street"
    t.string   "website"
    t.string   "description"
    t.integer  "capacity"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
