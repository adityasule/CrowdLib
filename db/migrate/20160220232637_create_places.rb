class CreatePlaces < ActiveRecord::Migration
  def change
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
end
