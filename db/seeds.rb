# frozen_string_literal: true

print '開発環境のデータをすべて削除して初期データを投入します。よろしいですか？[Y/n]: ' # rubocop:disable Rails/Output
unless $stdin.gets.chomp == 'Y'
  puts '中止しました。' # rubocop:disable Rails/Output
  return
end

def picture_file(name)
  File.open(Rails.root.join("db/seeds/#{name}"))
end

Book.destroy_all

Book.create!(
  title: 'Ruby超入門',
  memo: 'Rubyの文法の基本をやさしくていねいに解説しています。',
  author: '五十嵐 邦明',
  picture: picture_file('cho-nyumon.jpg')
)

Book.create!(
  title: 'チェリー本',
  memo: 'プログラミング経験者のためのRuby入門書です。',
  author: '伊藤 淳一',
  picture: picture_file('cherry-book.jpg')
)

Book.create!(
  title: '楽々ERDレッスン',
  memo: '実在する帳票から本当に使えるテーブル設計を導く画期的な本！',
  author: '羽生 章洋',
  picture: picture_file('erd.jpg')
)

Book.create!(
  title: '量子コンピュータを理解するための量子力学「超」入門',
  memo: '実量子コンピュータを理解するための量子力学「超」入門！',
  author: '村上 憲郎',
  picture: ''
)

Book.create!(
  title: '統計学の基礎から学ぶExcelデータ分析の全知識（できるビジネス） できるビジネスシリーズ',
  memo: '先行きが不透明ないまだからこそ、データ分析が武器になる',
  author: '三好 大悟',
  picture: ''
)

Book.create!(
  title: '集中演習 SQL入門 Google BigQueryではじめるビジネスデータ分析 できるDigital Camp',
  memo: 'データ分析のためのSQLが最速で身につく',
  author: '木田 和廣',
  picture: ''
)

Book.create!(
  title: 'プロを目指す人のためのTypeScript入門',
  memo: '安全なコードの書き方から高度な型の使い方まで',
  author: '鈴木 僚太 ',
  picture: ''
)

Book.create!(
  title: 'マンガでわかるWebマーケティング 改訂版 Webマーケッター瞳の挑戦! ',
  memo: 'Webマーケティングからデジタルマーケティングへ、ネット活用の超入門書',
  author: '村上 佳代',
  picture: ''
)

Book.create!(
  title: 'Linuxで動かしながら学ぶTCP/IPネットワーク入門',
  memo: 'この本は「手を動かしながら TCP/IP について学ぶ」をコンセプトにしています。',
  author: 'もみじあめ',
  picture: ''
)

Book.create!(
  title: 'LinkedIn(リンクトイン)活用大全 情報発信、起業、転職、人脈…ビジネスで一番使えるSNS',
  memo: 'ビジネスチャンスを得るための「LinkedIn活用のすべて」がわかる',
  author: '松本　淳',
  picture: ''
)

puts '初期データの投入が完了しました。' # rubocop:disable Rails/Output
