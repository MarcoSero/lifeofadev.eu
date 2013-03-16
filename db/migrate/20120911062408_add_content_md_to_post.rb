class AddContentMdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :content_md, :text
  end
end
