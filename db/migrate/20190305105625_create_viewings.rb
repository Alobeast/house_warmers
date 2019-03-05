class CreateViewings < ActiveRecord::Migration[5.2]
  def change
    create_table :viewings do |t|
      t.text :message
      t.references :tenant, foreign_key: {to_table: :users}
      t.references :landlord, foreign_key: {to_table: :users}
      t.references :flat, foreign_key: true

      t.timestamps
    end
  end
end
