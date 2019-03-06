class Review < ApplicationRecord
  belongs_to :flat
  belongs_to :tenant, class_name: 'User', optional:

  RATINGS = 1..5
  validates :area_rating, inclusion: {in: RATINGS}
  validates :noise_rating, inclusion: {in: RATINGS}
  validates :condition_rating, inclusion: {in: RATINGS}
  validates :energy_rating, inclusion: {in: RATINGS}
  validates :landlord_rating, inclusion: {in: RATINGS}
  validates :plumbing_rating, inclusion: {in: RATINGS}

  mount_uploader :proof_pic, PhotoUploader

  attribute :address
  before_validation :set_address

  def set_address
    if self.flat.nil?
      self.flat = Flat.new(address: address)
    end
  end

end
