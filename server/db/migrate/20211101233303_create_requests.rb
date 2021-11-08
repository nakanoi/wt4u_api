class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :title, null: false
      t.text :area, null: false
      t.integer :cost, null: false
      t.integer :number, null: false
      t.date :date, null: false
      t.integer :days, null: false
      t.string :genre, null: false
      t.integer :range, null: false
      t.text :context, null: false
      t.boolean :status, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
