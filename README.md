# README

# アプリケーション名: Donate-App
困っている人と支援したい人をつなぐためのサイトです。困っていれば支援の申し込みをします。もし支援者がいれば支援を受けることができます。逆に寄付を求めている人の一覧をみて助けてあげたい人がいれば寄付をすることができます。

# なぜこのアプリケーションを作ろうと思ったか？
貧困による格差が小さくなって欲しいという思いから作りました。僕は今まで東アジアの国を４つ回りました。観光地だけでなくスラムにも行きました。その中で気づいたことは、スラムの子供たちも携帯を持っておりインターネットにアクセスできるということです。実際に聞いたところ80%ほどは携帯を持っているということでした。また、ネットで(スラム　寄付)と検索してもボランティア団体やNPOに寄付することはできても直接貧しい人たちに寄付することはできません。そこで人と人が直接繋がれる寄付型サイトの着想を得ました。まずは、日本版サイトを作り最終的には英語や現地の言を取り入れていきたいと思います。

# 使用言語、開発環境
Ruby/Ruby on Rails/Haml/SCSS/Javascripit/VScode


# インフラ環境

# 実装機能一覧
・ユーザー登録、ログイン、ログアウト機能(devise)
・登録時のウィザード機能
・記事一覧表示機能
・記事詳細表示機能
・記事投稿機能
・画像ファイルのアップロード機能
・クレジット決済機能

今後の実装予定
・記事編集機能
・記事削除機能
・コメント機能
・いいね機能
・検索機能
・プレビュー機能
・AWSを利用
・dockerを組み込む
・circleCIを組み込む

# 使用方法
まずは



<img width="1080" alt="スクリーンショット 2021-03-09 17 08 18" src="https://user-images.githubusercontent.com/78077570/110439319-a8f8f780-80fa-11eb-8ca2-302cdd5d7114.png">

# テーブル設計

## ER図

<img width="1080" alt="スクリーンショット 2021-03-09 17 08 18" src="https://user-images.githubusercontent.com/78077570/110439319-a8f8f780-80fa-11eb-8ca2-302cdd5d7114.png">

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false ,unique: true|
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| phone_number       | string | null: false |


### Association

- has_many :supports
- has_many :orders

## addresses テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| postal_code     | string     | null: false |
| prefecture_id   | integer    | null: false |
| house_number    | string     | null: false |
| building_number | string     |             |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :user

## supports テーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| item            | string     | null: false |
| price           | integer    | null: false |
| reason          | text       | null: false |
| status          | text       | null: false |
| user            | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one_attached :image
- has_many :orders


## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :support
- belongs_to :user

