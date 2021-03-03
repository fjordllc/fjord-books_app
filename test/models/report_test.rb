# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    User.create!(id: '1', email: 'BBB@example.com', name: 'BBB', password: 'password')
    report = Report.create!(user_id: '1', title: 'aaa', content: 'AAA')
    current_user = report.user
    assert report.editable?(current_user)
  end

  test '#created_on' do
    User.create!(id: '1', email: 'BBB@example.com', name: 'BBB', password: 'password')
    report = Report.create!(user_id: '1', title: 'aaa', content: 'AAA', created_at: 'Wed, 03 Mar 2021 15:16:00.828572000 JST +09:00')
    assert_equal 'Wed, 03 Mar 2021'.to_date, report.created_on
  end
end
