# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :following_userfollows, foreign_key: 'follower_id', class_name: 'Userfollow', dependent: :destroy, inverse_of: 'follower'
  has_many :followings, through: :following_userfollows
  has_many :follower_userfollows, foreign_key: 'following_id', class_name: 'Userfollow', dependent: :destroy, inverse_of: 'following'
  has_many :followers, through: :follower_userfollows

  def following?(other_user)
    following_userfollows.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_userfollows.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_userfollows.find_by(following_id: other_user.id).destroy
  end
end
