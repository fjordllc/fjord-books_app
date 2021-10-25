# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :reverse_of_follow_relationships, class_name: 'FollowRelationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :followers, through: :reverse_of_follow_relationships, source: :follower

  has_many :follow_relationships, class_name: 'FollowRelationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followings, through: :follow_relationships, source: :followed

  def follow(user_id)
    follow_relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follow_relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end
end
