class CreatePlaces < ActiveRecord::Migration
  def up
    create_table :places do |t|
      t.string :name
      t.float :locationx
      t.float :locationy
      t.integer :clicks, :default => 0
      t.integer :crowd_max
      t.integer :crowd_current
      t.integer :noise_max
      t.integer :noise_num
      t.integer :comfort_max
      t.integer :comfort_num

      t.timestamps null: false
    end
  end

  def down
    drop_table :places
  end
end
