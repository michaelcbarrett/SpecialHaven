class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, :omniauth_providers => [:facebook]

  has_many :posts, dependent: :destroy
  has_many :text_posts, dependent: :destroy
  has_many :event_posts, dependent: :destroy
  has_many :image_posts, dependent: :destroy
  has_many :link_posts, dependent: :destroy
  has_many :video_posts, dependent: :destroy
  has_friendship

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = name_array(auth.info.name)[0]
      user.last_name = name_array(auth.info.name)[1]
      user.photo = auth.info.image
    end
  end

  def self.name_array(name)
    name_array = name.split(" ")
    if name_array.count == 1
      return [name_array.first, ""]
    elsif name_array.count == 2
      return name_array
    else
      return [name_array.first, name_array.last]
    end
  end
end
