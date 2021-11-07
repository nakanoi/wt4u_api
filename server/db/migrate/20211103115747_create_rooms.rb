class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.text :title, null: false
      t.text :token, null: false

      t.timestamps
    end
  end
end
