class RemoveOwnerFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :owner
  end
end
