class Flat < ApplicationRecord
  belongs_to :landlord, class_name: 'User', optional: true
  belongs_to :tenant, class_name: 'User', optional: true
  has_many :reviews, dependent: :destroy
  has_many :viewings, dependent: :destroy
  validates :address, uniqueness: true, presence: true
  enum letting_status: [ :pending, :confirmed, :declined]


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photo1, PhotoUploader
  mount_uploader :photo2, PhotoUploader
  mount_uploader :photo3, PhotoUploader
  mount_uploader :photo4, PhotoUploader
  mount_uploader :photo5, PhotoUploader

include PgSearch
  pg_search_scope :search_by_rental_price,
  against: [:rental_price],
  using: {
    tsearch: { prefix: true }
  }

end

