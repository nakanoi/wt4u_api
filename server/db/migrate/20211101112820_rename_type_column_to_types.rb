class RenameTypeColumnToTypes < ActiveRecord::Migration[6.1]
  def change
    rename_column :types, :type, :user_type
  end
end
