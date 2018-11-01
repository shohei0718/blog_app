class AddTitleToBlogs < ActiveRecord::Migration
  def change
    add_column :blogs, :blogs, :string
  end
end
