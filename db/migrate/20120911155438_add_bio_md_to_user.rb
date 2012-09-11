class AddBioMdToUser < ActiveRecord::Migration
  def change
    add_column :users, :bio_md, :text, :default => "That's my bio"
  end
end
