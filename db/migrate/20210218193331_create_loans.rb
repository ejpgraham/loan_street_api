class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.decimal :amount, :precision => 15, :scale => 5
      t.decimal :interest, :precision => 10, :scale => 5
      t.integer :length
      t.decimal :monthly_payment_amount, :precision => 10, :scale => 5

      t.timestamps
    end
  end
end
