class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :flats_as_tenant, foreign_key: :tenant_id, class_name: 'Flat'
  has_many :flats_as_landlord, foreign_key: :landlord_id, class_name: 'Flat'
  has_many :viewings_as_tenant, foreign_key: :tenant_id, class_name: 'Viewing'
  has_many :viewings_as_landlord, foreign_key: :landlord_id, class_name: 'Viewing'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
