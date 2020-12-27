# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    sign_in
  end

  test '日報のCRUD' do # rubocop:disable Metrics/BlockLength
    # 日報の登録
    click_link '日報'
    click_link '新規作成'
    fill_in 'タイトル', with: 'はじめての日報'
    fill_in '内容', with: 'はじめまして。よろしくお願いします。'
    click_button '登録する'

    assert_text '日報が作成されました。'
    assert_text 'はじめての日報'
    assert_text 'はじめまして。よろしくお願いします。'

    # 日報の編集
    click_link '編集'
    fill_in 'タイトル', with: 'My first report'
    fill_in '内容', with: 'Hello, everyone!'
    click_button '更新する'
    assert_text '日報が更新されました。'
    assert_text 'My first report'
    assert_text 'Hello, everyone!'

    # コメント登録
    fill_in 'comment[content]', with: 'コメントお待ちしています！'
    click_button 'コメントする'
    assert_text 'コメントが投稿されました。'
    assert_text 'コメントお待ちしています！'

    # 日報の一覧と日報の削除
    click_link '戻る'
    assert_css 'h1', text: '日報'
    within 'table' do
      assert_text 'My first report'
      click_link '削除'
      accept_confirm
    end
    assert_text '日報が削除されました。'
    within 'table' do
      assert_no_text 'My first report'
    end
  end

  test '日報のページネーション' do
    user = users(:komagata)
    1.upto(30) do |n|
      user.reports.create!(title: "日報-#{n}", content: '日報です。')
    end

    visit reports_path
    assert_text '日報-30'
    assert_text '日報-6'
    assert_no_text '日報-5'
    click_link '次'
    assert_no_text '日報-6'
    assert_text '日報-5'
    assert_text '日報-1'
  end
end
