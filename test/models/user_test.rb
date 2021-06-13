# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @alice = users(:alice)
    @bob = users(:bob)
    @carol = users(:carol)
  end

  test '#following? when Alice is following Bob' do
    assert(@alice.following?(@bob))
  end

  test '#following? when Alice is not following Carol' do
    assert_not(@alice.following?(@carol))
  end

  test '#followed_by? when Bob is following Alice' do
    assert(@bob.followed_by?(@alice))
  end

  test '#followed_by? when Carol is following Alice' do
    assert_not(@carol.followed_by?(@alice))
  end

  test '#follow when Alice is not following Carol' do
    assert_not_includes(@alice.followings, @carol)
    @alice.follow(@carol)
    assert_includes(@alice.followings, @carol)
  end

  test '#follow when Alice is not following Bob' do
    assert_includes(@alice.followings, @bob)
    @alice.follow(@bob)
    assert_includes(@alice.followings, @bob)
  end

  test '#unfollow when Alice is following Bob' do
    assert_includes(@alice.followings, @bob)
    @alice.unfollow(@bob)
    assert_not_includes(@alice.followings, @bob)
  end

  test '#unfollow when Alice is not following Carol' do
    assert_not_includes(@alice.followings, @carol)
    @alice.unfollow(@carol)
    assert_not_includes(@alice.followings, @carol)
  end

  test 'name when Alice has set her name' do
    assert_equal('Alice', @alice.name_or_email)
  end

  test 'name when Bob has not set his name' do
    assert_equal('bob@example.com', @bob.name_or_email)
  end
end
