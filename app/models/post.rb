class Post < ActiveRecord::Base
  actable
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
  validates :user_id, presence: true
  has_many :likes
  has_many :liked_by, through: :likes, source: :user
  acts_as_taggable
  


  def liked_by?(user)
  	Like.exists?(user: user, post: self)
  end

  def favorites
    self.liked_by.length
  end
  
  def self.tag_options
   [["Autism", "autism"],
    ["ADHD", "adhd"],
    ["Cerebral Palsy", "cerebral_palsy"],
    ["Dyslexia", "dyslexia"],
    ["Epilepsy", "epilepsy"],
    ["Fragile X Syndrome", "fragile_x_syndrome"],
    ]
  end

end
