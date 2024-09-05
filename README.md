# テーブル設計

## groups テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| description         | text       | null: false |


### Association
- has_many :users
- has_many :notices
- has_many :circulars


## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| admin              | boolean    | null: false, default: false    |
| group              | references | null: false, foreign_key: true |


### Association

- belongs_to :group
- has_many :notices
- has_many :circulars


## notices テーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| title    | string     | null: false |
| content  | text       | null: false |
| schedule | date       |
| tag_id   | integer    | null: false |
| user     | references | null: false, foreign_key: true |
| group    | references | null: false, foreign_key: true |


### Association

- belongs_to :group
- belongs_to :user
- has_many :reads

## reads テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| notice   | references | foreign_key: true              |
| circular | references | foreign_key: true              |
| complete | boolean    | null: false, default: false    |

### Association

- belongs_to :user
- belongs_to :notice
- belongs_to :circular

## circulars テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| pdf_file | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| group    | references | null: false, foreign_key: true |


### Association

- belongs_to :group
- belongs_to :user
- has_many :reads