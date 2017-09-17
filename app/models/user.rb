class User < ActiveRecord::Base

  has_many :posts
  has_many :written_comments, class_name: "Comment"
  has_many :received_comments, through: :posts, source: :comment

  validates :username, :email, presence: true
  validates_uniqueness_of :username, :email

  has_secure_password


end
