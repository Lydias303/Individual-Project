class AddColumnStateToEvent < ActiveRecord::Migration
  def change
    add_column :events, :state, :string
  end
end
