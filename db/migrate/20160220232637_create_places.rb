class CreatePlaces < ActiveRecord::Migration
  def up
    create_table :places do |t|
      t.string :name
      t.float :locationx
      t.float :locationy
      t.float :crowd
      t.float :noise
      t.float :comfort

      t.timestamps null: false
    end
  end

  def down
    drop_table :places
  end
end
