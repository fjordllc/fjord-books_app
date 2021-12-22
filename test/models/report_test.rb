# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    report = Report.new(title: '', content: '')
    user = User.new(email: 'foo@example.com', name: '')
    report.user = user

    assert report.editable?(user)
  end

  test '#created_on' do
    report = Report.new(title: '', content: '', created_at: 'Thu, 16 Dec 2021 22:57:34.382564000 JST +09:00')

    assert_equal 'Thu, 16 Dec 2021'.to_date, report.created_on
  end
end
