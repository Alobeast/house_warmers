class AddColumnsToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :area_rating, :integer
    add_column :reviews, :noise_rating, :integer
    add_column :reviews, :condition_rating, :integer
    add_column :reviews, :energy_rating, :integer
    add_column :reviews, :landlord_rating, :integer
    add_column :reviews, :plumbing_rating, :integer
  end
end
