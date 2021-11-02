class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :title
      t.text :area
      t.integer :cost
      t.integer :number
      t.date :date
      t.integer :days
      t.string :genre
      t.integer :range
      t.text :context
      t.boolean :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
