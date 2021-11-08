class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.string :type, null: false
      t.references :user, null: false, foreign_key: true, unique: true

      t.timestamps
    end
  end
end
