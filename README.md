# アプリケーション名
townfo(タウンフォ)  
（URL）

## テスト用アカウント
・Basic認証ID：  
・Basic認証Password：  
### 「group1」管理者アカウント
・メールアドレス：  
・パスワード：  
### 「group1」メンバーアカウント
・メールアドレス：  
・パスワード：  

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
・一覧  
・新規作成  
・編集  
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

・テキストエディタ  
VSCode

・その他  
バージョン管理：Git,GitHub  
タスク管理：Notion  

# アプリ作成の背景
ある雨の朝、おじいちゃんが町中を車で回りながら叫んでいた。

「今日の清掃は中止でーす！」

僕は情報伝達方法のアナログさに衝撃を受けた。  
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

## グループへの参加に採用した「承認制」
「グループに入っているメンバー」と「承認待ちのユーザー」でテーブルを分ける設計。  
承認制をとることで、グループ内におけるセキュリティを強める意図。