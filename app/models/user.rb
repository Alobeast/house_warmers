class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :flats_as_tenant, foreign_key: :tenant_id, class_name: 'Flat'
  has_many :flats_as_landlord, foreign_key: :landlord_id, class_name: 'Flat'
  has_many :viewings_as_tenant, foreign_key: :tenant_id, class_name: 'Viewing'
  has_many :viewings_as_landlord, foreign_key: :landlord_id, class_name: 'Viewing'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]

  def self.from_omniauth(auth)
    access_token = auth.credentials.token
    graph = Koala::Facebook::API.new(access_token)
    Rails.logger.info "Me:" + graph.get_object("me").inspect
    friends = graph.get_connections("me", "friends")
    Rails.logger.info "Friends: " + friends.inspect

    user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end

    user.friends = friends
    return user
  end

  def is_friends_with?(other_user)
    friends.each do |friend|
      if friend["id"] == other_user.uid
        return true
      end
    end
    return false
  end
end
