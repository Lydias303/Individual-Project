class AddColumnCityToEvent < ActiveRecord::Migration
  def change
    add_column :events, :city, :string
    add_column :events, :lng, :decimal
    add_column :events, :lat, :decimal
  end
end
