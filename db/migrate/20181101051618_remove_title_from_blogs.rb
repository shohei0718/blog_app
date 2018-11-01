class RemoveTitleFromBlogs < ActiveRecord::Migration
  def change
    remove_column :blogs, :blogs, :string
  end
end
