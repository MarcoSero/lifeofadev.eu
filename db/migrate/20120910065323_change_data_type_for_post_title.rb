class ChangeDataTypeForPostTitle < ActiveRecord::Migration
  def up
    change_table :posts do |t|
      t.change :title, :string
    end
  end

  def down
    change_table :posts do |t|
      t.change :title, :text
    end
  end
end
