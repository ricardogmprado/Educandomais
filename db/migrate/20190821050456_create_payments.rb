class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.references :donator, foreign_key: true
      t.string :status
      t.date :date
      t.integer :value
      t.string :duration

      t.timestamps
    end
  end
end
