class ChangeReviewsColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :tenant_id, :integer
    add_foreign_key :reviews, :users, column: :tenant_id
  end
end
