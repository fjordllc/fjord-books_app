# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable' do
    me = User.create!(email: 'me@example.com', password: 'password')
    report = me.reports.new(title: '新年', content: 'お正月')
    assert_equal true, report.editable?(me)
  end
  test '#created_on' do
    me = User.create!(email: 'me@example.com', password: 'password')
    report = me.reports.new(title: '新年', content: 'お正月')
    report.save
    assert_equal Time.zone.today, report.created_on
  end
end
