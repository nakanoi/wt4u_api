class CreateTourists < ActiveRecord::Migration[6.1]
  def change
    create_table :tourists do |t|
      t.references :user, null: false, foreign_key: true, uniqueness: true
      t.references :type, null: false, foreign_key: true, uniqueness: true

      t.timestamps
    end
  end
end
