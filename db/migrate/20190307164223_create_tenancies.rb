class CreateTenancies < ActiveRecord::Migration[5.2]
  def change
    create_table :tenancies do |t|
      t.references :flat
      t.references :user
      t.timestamps
    end
  end
end
