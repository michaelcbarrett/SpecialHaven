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
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
  has_friendship

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.photo = auth.info.image
    end
  end
end
