class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :flats_as_tenant, foreign_key: :tenant_id, class_name: 'Flat'
  has_many :flats_as_landlord, foreign_key: :landlord_id, class_name: 'Flat'
  has_many :viewings_as_tenant, foreign_key: :tenant_id, class_name: 'Viewing'
  has_many :viewings_as_landlord, foreign_key: :landlord_id, class_name: 'Viewing'

  has_many :tenancies_as_tenant, foreign_key: :tenant_id, class_name: 'Tenancy'

  has_many :orders, dependent: :destroy

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


  def friend_tenancies_near(flat)
    address = flat.address
    friend_apartments = friends_matched_tenancies(address)
    lived_in = []
    lived_close = []
    friend_apartments.each do |a|
      if a.flat.address == address
        lived_in << a
      else
        lived_close << a
      end
    end
    {
      lived_in: lived_in,
      lived_close: lived_close
    }
  end

  def friends_matched_tenancies(address)
    tenancies = tenancies_near(address)
    friend_ids = if friends
                  friends.map { |f| f["id"] }
                  else
                  []
                  end
    matched_friends = []
    tenancies.each do |t|
      if friend_ids.include?(t.user.uid)
        matched_friends << t
      end
    end
    return matched_friends
  end

  def tenancies_near(address)
    Flat.near(address).includes(:tenancies).flat_map(&:tenancies)
  end
end
