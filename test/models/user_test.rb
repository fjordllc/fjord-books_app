require "test_helper"

class UserTest < ActiveSupport::TestCase
  test '#following?' do
    user1 = User.new(email: 'foo@example.com')
    user2 = User.new(email: 'bar@example.com')
    assert_equal false, user1.following?(user2)
  end

  test '#followed_by?' do
    user1 = User.create!(email: 'foo@example.com', password: 'password')
    user2 = User.create!(email: 'bar@example.com', password: 'password')
    user1.follow(user2)
    assert user2.followed_by?(user1)
  end

  test '#follow' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')
    me.follow(she)
    assert me.following?(she)
  end

  test '#unfollow' do
    me = User.create!(email: 'me_unfollow@example.com', password: 'password')
    she = User.create!(email: 'she_unfollow@example.com', password: 'password')
    me.follow(she)
    me.unfollow(she)
    assert_not me.following?(she)
  end

  test '#name_or_email' do
    user = User.new(email: 'foo@example.com')
    assert_equal 'foo@example.com', user.name_or_email
    user.name = 'bar'
    assert_equal 'bar', user.name_or_email
  end
end
