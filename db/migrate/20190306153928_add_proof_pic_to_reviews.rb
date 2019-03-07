class AddProofPicToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :proof_pic, :string
  end
end
