require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  setup do
    @komagata = users(:komagata)
    @machida = users(:machida)
    @matz = users(:matz)

    @machida.follow(@komagata)
    @machida.follow(@matz)

    sign_in
  end

  test 'follow / unfollow' do
    click_link 'ユーザ'
    within 'table' do
      assert_text '駒形 真幸'
      assert_text '町田 哲平'
      assert_text 'Matz'
    end

    visit user_path(@machida)
    assert_text '氏名: 町田 哲平'
    assert_link '2 フォロー'
    assert_link '0 フォロワー'

    # フォロー
    click_button 'フォローする'
    assert_text 'フォローしました。'
    assert_link '2 フォロー'
    assert_link '1 フォロワー'

    # フォロー一覧
    click_link '2 フォロー'
    within 'table' do
      assert_text '駒形 真幸'
      assert_no_text '町田 哲平'
      assert_text 'Matz'
    end
    click_link '戻る'

    # フォロワー一覧
    click_link '1 フォロワー'
    within 'table' do
      assert_text '駒形 真幸'
      assert_no_text '町田 哲平'
      assert_no_text 'Matz'
    end
    click_link '戻る'

    # フォロー解除
    click_button 'フォロー解除する'
    assert_text 'フォロー解除しました。'
    assert_link '2 フォロー'
    assert_link '0 フォロワー'

    # 自分のページにはフォロー/フォロー解除ボタンが表示されない
    visit user_path(@komagata)
    assert_text '氏名: 駒形 真幸'
    assert_link '0 フォロー'
    assert_link '1 フォロワー'
    assert_no_button 'フォローする'
    assert_no_button 'フォロー解除する'
  end
end
