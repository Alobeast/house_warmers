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
  before_validation :average_rating

  def average_rating
    average_noise = reviews.blank? ? 0 : reviews.map(&:noise_rating).sum / reviews.count
    average_condition = reviews.blank? ? 0 : reviews.map(&:condition_rating).sum / reviews.count
    average_energy = reviews.blank? ? 0 : reviews.map(&:energy_rating).sum / reviews.count
    average_landlord = reviews.blank? ? 0 : reviews.map(&:landlord_rating).sum / reviews.count
    average_plumbing = reviews.blank? ? 0 : reviews.map(&:plumbing_rating).sum / reviews.count
    average_area = reviews.blank? ? 0 : reviews.map(&:area_rating).sum / reviews.count

    average_long = (average_noise + average_condition + average_energy + average_landlord + average_plumbing + average_area) * 10 / 6
    average = average_long.truncate
    average / 10.0
  end
end
