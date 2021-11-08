class AddnameToRequests < ActiveRecord::Migration[6.1]
  def change
    add_column :requests, :name, :string
  end
end
