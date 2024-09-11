# テーブル設計

## groups テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| name                | string     | null: false |
| description         | text       | null: false |
| owner_id            | integer    | null: false |

### Association
<!-- 承認済みのユーザーとの関連 -->
- has_many :memberships
- has_many :users, through: :memberships, source: :user
<!-- 承認待ちのユーザーとの関連 -->
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
<!--承認済みのグループとの関連付け -->
- has_many :memberships
- has_many :groups, through: :memberships, source: :group
<!-- 承認待ちのグループとの関連付け -->
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
- belongs_to :readable, polymorphic: true