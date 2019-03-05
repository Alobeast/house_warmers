class AddPhotoAndBathroomsToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :photo1, :string
    add_column :flats, :photo2, :string
    add_column :flats, :photo3, :string
    add_column :flats, :photo4, :string
    add_column :flats, :photo5, :string
    add_column :flats, :bathrooms, :integer
  end
end
