class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.string :address
      t.string :description
      t.boolean :available, default: false
      t.integer :bedrooms
      t.integer :rental_price
      t.integer :size
      t.integer :build_year
      t.string :letting_status
      t.integer :deposit_amount
      t.references :tenant, foreign_key: {to_table: :users}
      t.references :landlord, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
