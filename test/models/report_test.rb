# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    user = User.create!(email: 'me@example.com', password: 'password')
    report = Report.create!(user_id: user.id, title: '日報のタイトル', content: '日報の内容')

    assert report.editable?(user)
  end

  test '#created_on' do
    user = User.create!(email: 'me@example.com', password: 'password')
    report = Report.create!(user_id: user.id, title: '日報のタイトル', content: '日報の内容')

    assert_equal report.created_at.to_date, report.created_on
  end
end
