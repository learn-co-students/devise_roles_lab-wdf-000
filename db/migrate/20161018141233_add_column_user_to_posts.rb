class AddColumnUserToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user, :integer, default: "user"
  end
end
