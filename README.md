# アプリケーション名
townfo(タウンフォ)  
http://52.69.79.34/

## テスト用アカウント
・Basic認証ID： admin  
・Basic認証Password：2222  
### 「group1」管理者アカウント
・お名前： owner1  
・メールアドレス： owner1@owner.com   
・パスワード： 111111
### 「group1」メンバーアカウント
・お名前: member1  
・メールアドレス： member1@member.com  
・パスワード： 111111

# 概要
回覧板の機能をデジタルで再現。
さらに、個人単位での投稿も可能。  
町(town)の情報(info)がすべてこのtownfoに集約。

# 利用方法
①ヘッダーから「新規登録」を行う。  
[![Image from Gyazo](https://i.gyazo.com/00ac2122270dba2d93d5f57a2f182607.png)](https://gyazo.com/00ac2122270dba2d93d5f57a2f182607)  
②「グループを立ち上げる」「グループに参加する」のどちらかを選択する。  
[![Image from Gyazo](https://i.gyazo.com/4d29b1a523ae7a2dc471251f78926531.png)](https://gyazo.com/4d29b1a523ae7a2dc471251f78926531)  

## 「グループを立ち上げる」を選んだ場合
③グループの情報を入力してtownfoスタート！  
立ち上げたユーザーはそのグループの管理者となる。  
## 「グループに参加する」を選んだ場合
③参加したいグループを一覧から選択して、参加申請を送信する。  
[![Image from Gyazo](https://i.gyazo.com/dd792167edea6fb2ee88d6ae9ec6a296.png)](https://gyazo.com/dd792167edea6fb2ee88d6ae9ec6a296)  
④管理者のアカウントでログイン。  
⑤ヘッダーのグループ名を押下し、表示される承認待ち一覧から③で送信したアカウントを承認。  
[![Image from Gyazo](https://i.gyazo.com/b23f749726260f08c64170c29905ea39.png)](https://gyazo.com/b23f749726260f08c64170c29905ea39)  
⑥ログアウトし、再度③で送信したアカウントでログイン。  
⑦参加申請が承認され、townfoスタート！  
[![Image from Gyazo](https://i.gyazo.com/4335df362151b7b0385635090d5e777b.png)](https://gyazo.com/4335df362151b7b0385635090d5e777b)

# 機能一覧
## ユーザー管理機能(devise)
・新規登録  
・編集  
・ログイン  
・ログアウト  
・マイページ  
## グループ管理機能
・一覧  
・検索(ransack)  
・新規作成  
・編集  
・削除  
・詳細表示（承認待ちユーザー・グループメンバー一覧）  
## メンバー管理機能
・加入申請  
・承認  
・退会  
## お知らせ管理機能
・一覧（リスト・カレンダー）  
・新規作成（chatgpt連携）  
・編集（chatgpt連携）  
・削除  
・詳細  
・既読(polymorphic)  
## 回覧板管理機能
・一覧  
・新規作成  
・削除  
・詳細  
・既読(polymorphic)  

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/a2e23cfff69f1abc4202cf979909acdf.png)](https://gyazo.com/a2e23cfff69f1abc4202cf979909acdf)

# 使用技術
・フロントエンド  
HTML  
CSS  
JavaScript

・バックエンド  
ruby 3.2.0  
Ruby on Rails 7.0.0

・テスト  
RSpec

・インフラ  
AWS EC2, S3

・テキストエディタ  
VSCode

・その他  
バージョン管理：Git,GitHub  
タスク管理：Notion  

# アプリ作成の背景
ある雨の朝、おじいちゃんが町中を車で回りながら叫んでいた。

「今日の清掃は中止でーす！」

私は情報伝達方法のアナログさに衝撃を受けた。  
この出来事をきっかけに、町の情報が集まる場所を作ろうと決めた。  

アプリの仕様は私が住む地域の回覧板を参考に作成。

# 工夫したポイント
## 「分かりやすさ」を優先したデザイン。  
ターゲットユーザーを「高齢者」と定めた上での設計。  

## 2種類の既読機能  
・お知らせ投稿  
投稿の最上部から最下部がブラウザに表示されたことを基準に取得する。  
よくある詳細画面を開いたら既読を付ける実装では  
リアルを反映できないという課題をクリア。  

・回覧板投稿  
「見ました」ボタンによる手動で既読を付け、  
「誰が」「いつ」既読を付けたのかを管理者のみが分かる仕様に。

## AIによる自動生成機能
AIの機能を町の方々に手軽にお試しいただきたく、実装。  
### 仕様
「AIアシスト」ボタンを押すと、モーダルウィンドウが表示。  
お知らせ投稿の文章に含めたい情報をプロンプトに記載。  
「生成する」ボタンを押すことで、自動的にフォームに格納される。  
<a href="https://gyazo.com/c4161afa1c326e200b2032ea4ab21617"><img src="https://i.gyazo.com/c4161afa1c326e200b2032ea4ab21617.gif" alt="Image from Gyazo" width="1270.6666666666667"/></a>


<!-- DB design -->
<!--# テーブル設計

## groups テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| description         | text       | null: false |
| owner_id            | integer    | null: false |

### Association
- has_many :memberships
- has_many :users, through: :memberships, source: :user
- has_many :pending_memberships
- has_many :pending_users, thorough: :pending_memberships, source: :user
- has_many :notices
- has_many :circulars

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |

### Association
- has_many :memberships
- has_many :groups, through: :memberships, source: :group
- has_many :pending_memberships
- has_many :pending_groups, through: :pending_memberships, source: :group
- has_many :notices
- has_many :circulars
- has_many :reads

## memberships テーブル

| Column | Type           | Options                                 |
| ------ | -------------- | --------------------------------------- |
| group  | references     | null: false, foreign_key: true          |
| user   | references     | null: false, foreign_key: true          |

### Association
- belongs_to :group
- belongs_to :user

## pending_memberships テーブル

| Column | Type           | Options                                 |
| ------ | -------------- | --------------------------------------- |
| group  | references     | null: false, foreign_key: true          |
| user   | references     | null: false, foreign_key: true          |

### Association
- belongs_to :group
- belongs_to :user

## notices テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| content  | text       | null: false                    |
| schedule | date       |
| tag_id   | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |
| group    | references | null: false, foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user
- has_many :reads
- has_one_attached :image

## circulars テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| user     | references | null: false, foreign_key: true |
| group    | references | null: false, foreign_key: true |

### Association

- belongs_to :group
- belongs_to :user
- has_many :reads
- has_one_attached :pdf_file

## reads テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| readable_type | string     | null: false, polymorphic: true |
| readable_id   | integer    | null: false                    |
| complete      | boolean    | null: false, default: false    |

### Association

- belongs_to :user
- belongs_to :readable, polymorphic: true  -->
