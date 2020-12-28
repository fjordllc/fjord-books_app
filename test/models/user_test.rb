# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'name_or_email' do
    user = users(:komagata)
    assert_equal '駒形 真幸', user.name_or_email

    user.name = ''
    assert_equal 'komagata@example.com', user.name_or_email
  end

  test 'follow / unfollow' do # rubocop:disable Metrics/BlockLength
    komagata = users(:komagata)
    machida = users(:machida)

    assert_not komagata.following?(machida)
    assert_not machida.followed_by?(komagata)
    assert_equal [], komagata.followings
    assert_equal [], komagata.followers
    assert_equal [], machida.followings
    assert_equal [], machida.followers

    komagata.follow(machida)
    komagata.reload
    machida.reload
    assert komagata.following?(machida)
    assert machida.followed_by?(komagata)
    assert_equal [machida], komagata.followings
    assert_equal [], komagata.followers
    assert_equal [], machida.followings
    assert_equal [komagata], machida.followers

    komagata.unfollow(machida)
    komagata.reload
    machida.reload
    assert_not komagata.following?(machida)
    assert_not machida.followed_by?(komagata)
    assert_equal [], komagata.followings
    assert_equal [], komagata.followers
    assert_equal [], machida.followings
    assert_equal [], machida.followers
  end
end
