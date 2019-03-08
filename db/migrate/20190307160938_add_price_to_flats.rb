class AddPriceToFlats < ActiveRecord::Migration[5.2]
  def change
    add_monetize :flats, :price, currency: { present: false }
  end
end
