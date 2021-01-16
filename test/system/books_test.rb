# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
    visit root_url
    fill_in 'Eメール',with:'alice@example.com'
    fill_in 'パスワード',with:'password'
    click_button 'ログイン'
  end

  test 'visiting the report index' do
    visit reports_url
    assert_selector 'h1', text: '日報'
  end

  test 'creating a new book' do
    visit reports_url
    click_on '新規作成'
    fill_in 'タイトル', with: "タイトル"
    fill_in '内容', with: "内容"
    click_on '登録する'
  end

end
