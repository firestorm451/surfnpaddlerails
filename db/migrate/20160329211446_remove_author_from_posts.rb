class RemoveAuthorFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :author, :string
    add_column :posts, :author_id, :integer
  end
end
