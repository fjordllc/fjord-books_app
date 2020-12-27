require 'application_system_test_case'

class DeviseTest < ApplicationSystemTestCase
  test 'sign up / sign in / sign out / edit profile / edit password' do
    # アカウント登録
    visit root_path
    assert_css 'h2', text: 'ログイン'
    click_link 'アカウント登録'
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in '氏名', with: 'アリス'
    fill_in '郵便番号', with: '156-0043'
    fill_in '住所', with: '東京都世田谷区松原2-34-11 ベルヴィカワダ 201'
    fill_in '自己紹介文', with: 'よろしくお願いします。'
    attach_file 'ユーザ画像', Rails.root.join('test/fixtures/files/piyord.png')
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード（確認用）', with: 'password'
    assert_changes("User.count", from: 0, to: 1) do
      click_button 'アカウント登録'
    end
    assert_text 'アカウント登録が完了しました。'
    assert_text 'alice@example.com としてログイン中'

    # ログアウトとログイン
    click_link 'ログアウト'
    assert_text 'ログアウトしました。'
    assert_css 'h2', text: 'ログイン'
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
    assert_text 'ログインしました。'

    # 登録情報の確認
    click_link 'ユーザ'
    assert_css 'h1', text: 'ユーザ'
    within 'table' do
      assert_text 'alice@example.com'
      assert_text 'アリス'
      assert_text '156-0043'
      assert_text '東京都世田谷区松原2-34-11 ベルヴィカワダ 201'
      click_link '詳細'
    end
    assert_css 'h1', text: 'ユーザの詳細'
    assert_text 'alice@example.com'
    assert_text 'アリス'
    assert_text '156-0043'
    assert_text '東京都世田谷区松原2-34-11 ベルヴィカワダ 201'
    assert_text 'よろしくお願いします。'
    assert find('img')['src'].end_with?('piyord.png')

    # アカウント編集
    click_link 'アカウント編集'
    fill_in 'Eメール', with: 'alice-2@example.com'
    fill_in '氏名', with: 'ありす'
    fill_in '郵便番号', with: '156-9999'
    fill_in '住所', with: '東京都世田谷区松原2-34-11 ベルヴィカワダ 999'
    fill_in '自己紹介文', with: 'よろしくお願いします！'
    attach_file 'ユーザ画像', Rails.root.join('test/fixtures/files/komagata.jpg')
    click_button '更新'
    expect(page).to have_content 'アカウント情報を変更しました。'

    # 編集情報の確認
    visit user_path(User.find_by(email: 'alice-2@example.com'))
    assert_text 'alice-2@example.com'
    assert_text 'ありす'
    assert_text '156-9999'
    assert_text '東京都世田谷区松原2-34-11 ベルヴィカワダ 999'
    assert_text 'よろしくお願いします！'
    assert find('img')['src'].end_with?('komagata.jpg')

    # パスワードの変更と再ログイン
    click_link 'アカウント編集'
    fill_in 'パスワード', with: 'password!!'
    fill_in 'パスワード（確認用）', with: 'password!!'
    click_button '更新'
    expect(page).to have_content 'アカウント情報を変更しました。'

    click_link 'ログアウト'
    assert_text 'ログアウトしました。'
    assert_css 'h2', text: 'ログイン'
    fill_in 'Eメール', with: 'alice-2@example.com'
    fill_in 'パスワード', with: 'password!!'
    click_button 'ログイン'
    assert_text 'ログインしました。'
  end
end
