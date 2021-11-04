class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.text :title
      t.text :token

      t.timestamps
    end
  end
end
