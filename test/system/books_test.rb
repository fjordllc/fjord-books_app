# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'creating a Report' do
    visit root_url
    click_on '日報'
    click_on '新規作成'
    fill_in 'タイトル', with: '本日取り組んだこと'
    fill_in '内容', with: '「自動テストに取り組んだ。'
    click_button '登録する'

    assert_text '日報が作成されました。'
    assert_text '本日取り組んだこと'
    assert_text '「自動テストに取り組んだ。'
    click_on '戻る'
  end

  test 'updating a Report' do
    visit root_url
    click_on '日報'
    click_on '編集', match: :prefer_exact
    fill_in 'タイトル', with: '明日取り組むこと'
    fill_in '内容', with: 'メモアプリの作成に取り組む。'
    click_button '更新する'

    assert_text '日報が更新されました。'
    assert_text '明日取り組むこと'
    assert_text 'メモアプリの作成に取り組む。'

    click_on '戻る'
  end

  test 'deleting a Report' do
    visit root_url
    click_on '日報'
    page.accept_confirm do
      click_on '削除'
    end
    assert_text '日報が削除されました。'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'Ruby超入門'
    fill_in 'メモ', with: 'すごくわかりやすい！！'
    fill_in '著者', with: 'igaigaさん'
    click_on '登録する'

    assert_text '本が作成されました。'
    assert_text 'Ruby超入門'
    assert_text 'すごくわかりやすい！！'
    assert_text 'igaigaさん'

    click_on '戻る'
  end

  test 'updating a Book' do
    visit books_url
    click_on '編集', match: :prefer_exact

    fill_in 'タイトル', with: 'Ruby超超入門'
    fill_in 'メモ', with: '超わかりやすい！！'
    fill_in '著者', with: 'igaigaguyさん'
    click_on '更新する'

    assert_text '本が更新されました。'
    assert_text 'Ruby超超入門'
    assert_text '超わかりやすい！！'
    assert_text 'igaigaguyさん'
    click_on '戻る'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
  end
end
