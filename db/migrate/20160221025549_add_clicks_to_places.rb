class AddClicksToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :clicks, :integer
  end
end
