class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, dependent: :destroy
  has_many :text_posts, dependent: :destroy
  has_many :event_posts, dependent: :destroy
  has_many :image_posts, dependent: :destroy
  has_many :link_posts, dependent: :destroy
  has_many :video_posts, dependent: :destroy
end
