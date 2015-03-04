class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string   :display_name
      t.string   :country
      t.string   :city
      t.string   :zip
      t.decimal  :lat
      t.decimal  :lng
      t.string   :street
      t.string   :website
      t.string   :description
      t.integer  :capacity
      t.string   :website

      t.timestamps null: false
    end
  end
end
