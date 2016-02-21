class AddUpvotesToComments < ActiveRecord::Migration
  def change
    add_column :comments, :upvotes, :integer, :defaut => 0
  end
end
