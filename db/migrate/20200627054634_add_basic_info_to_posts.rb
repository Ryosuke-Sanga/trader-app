class AddBasicInfoToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :need, :text
    add_column :posts, :notneed, :text
    add_column :posts, :user_id, :integer
  end
end
