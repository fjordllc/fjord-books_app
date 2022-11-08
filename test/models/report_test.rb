# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable?' do
    user1 = User.new(email: 'foo@example.com')
    user2 = User.new(email: 'bar@example.com')
    report = Report.new(user_id: user1.id, title: 'テスト', content: 'foobar')
    assert report.editable?(user1.id)
    assert_not report.editable?(user2)
  end

  test 'created_on' do
    user1 = User.new(email: 'foo@example.com')
    report = Report.new(user_id: user1.id, title: 'テスト', content: 'foobar', created_at: DateTime.new(1993, 2, 24, 12, 30, 45))
    date = DateTime.new(1993, 2, 24, 12, 30, 45).to_date
    assert_equal date, report.created_on
  end
end
