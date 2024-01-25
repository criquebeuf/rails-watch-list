class RenameColumnList < ActiveRecord::Migration[7.1]
  def change
    rename_column :lists, :title, :name
  end
end
