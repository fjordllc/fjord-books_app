# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test 'editable?' do
    report = reports(:komagata)
    komagata = users(:komagata)
    machida = users(:machida)

    assert report.editable?(komagata)
    assert_not report.editable?(machida)
  end

  test 'created_on' do
    report = reports(:komagata)
    assert_equal Date.current, report.created_on
  end
end
