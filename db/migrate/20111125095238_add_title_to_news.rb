class AddTitleToNews < ActiveRecord::Migration
  def change
    add_column :news, :title, :text
  end
end
