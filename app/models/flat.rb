class Flat < ApplicationRecord
  belongs_to :landlord, class_name: 'User'
  belongs_to :tenant, class_name: 'User'
  has_many :reviews, dependent: :destroy
  has_many :viewings, dependent: :destroy
  validates :address, uniqueness: true, presence: true
  enum letting_status: [ :pending, :confirmed, :declined]
end
