# frozen_string_literal: true

require 'test_helper'
require 'byebug'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    user_alice = users(:alice)
    user_bob = users(:Bob)
    report=Report.new(id:1,user_id: user_alice.id,title:"タイトル",content:"内容")
    assert report.editable?(user_alice)
    assert_not report.editable?(user_bob)

  end

  test '#created_on?' do
    report=Report.new(id:1,title:"タイトル",content:"内容",created_at:"2021-01-15 20:17:38.421033000 +0900" )
    assert_equal "Fri, 15 Jan 2021".to_date ,report.created_on
  end
end
