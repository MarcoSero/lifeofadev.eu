class AddSlugToPost < ActiveRecord::Migration
  def change
    add_column :posts, :slug, :text
  end
end
