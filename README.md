# アプリケーション名
  Teacher Talk
# アプリケーション概要
  中学校・高等学校の先生同士で、悩み事や指導法などを共有できる先生限定のコミュニティサイト
# URL
  https://teacher-talk.onrender.com
# テスト用アカウント
  ・Basic認証パスワード：2222<br>
  ・Basic認証ID：admin<br>
  ・メールアドレス：作成中につき未設定<br>
  ・パスワード：作成中につき未設定<br>
# 利用方法
  ## トピック（お悩みなど）投稿
  ## コメント投稿
  ## フォロー
  ## いいね
  ## チャット
# アプリケーションを作成した背景
  学校教材営業を経験し、多くの先生と話してきた中で、学校の先生から、他校の活用事例や、他校の先生がどんな教材を使っているのかを知りたいというお声をいただくことが多く、他の先生と情報交換ができる機会が少ないことを実感した。<br>
  現在働いている会社でも、先生向けのイベントを開くことがあるが、多忙につき、参加できないという先生方も多くいる。<br>
  そんな中で、オンラインで、気軽に交流できる場があれば良いのではと思い、先生同士でコミュニケーションが取れるようなアプリケーションを開発することにした。
# 洗い出した要件
  [要件を定義したシート](https://docs.google.com/spreadsheets/d/135dB8e-PiRYfW2Wk_vovbjhWQPUx2_lsFIZdDcL5WLQ/edit?usp=sharing) 
# 実装した機能についての画像やGIFおよびその説明
  現在作成中
# 実装予定の機能
  現在、新規登録機能を実装中。<br>
  その後、トピック投稿機能、コメント機能などを実装予定。
# データベース設計
 [![Image from Gyazo](https://i.gyazo.com/6588f57d3355c9c98378957a052fffcc.png)](https://gyazo.com/6588f57d3355c9c98378957a052fffcc)

# テーブル設計

## Users テーブル
|Column             |Type    |Options                  |
|-------------------|--------|-------------------------|
|name               |string  |null: false              |
|email              |string  |null: false, unique:true |
|encrypted_password |string  |null: false              |
|age_id             |integer |null: false              |
|subject_id         |integer |null: false              |
|prefecture_id      |integer |null: false              |
|operation_id       |integer |null: false              |
|schooltype_id      |integer |null: false              |
|school_name        |string  |null: false              |

### Association
- has_many :sns_credentials
- has_many :topics
- has_many :comments
- has_many :likes
- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
- has_many :followings, through: :active_relationships, source: :follower
- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
- has_many :followers, through: :passive_relationships, source: :following


## SnsCredentials テーブル
|Column   |Type       |Options                        |
|---------|-----------|-------------------------------|
|provider |string     |null: false                    |
|uid      |string     |null: false                    |
|user     |references |null: false, foreign_key: true |

### Association
- belongs_to :user, optional: true


## Topics テーブル
|Column        |Type       |Options                        |
|--------------|-----------|-------------------------------|
|topic_title   |string     |null: false                    |
|topic_content |text       |null: false                    |
|user          |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :tags
- has_many :topic_tag_relationships
- has_many :comments

## Tags テーブル
|Column   |Type   |Options     |
|---------|-------|------------|
|tag_name |string |null: false |

### Association
- has_many :topics
- has_many :topic_tag_relationships


## TopicTagRelations テーブル
|Column|Type       |Options                        |
|------|-----------|-------------------------------|
|topic |references |null: false, foreign_key: true |
|tag   |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :tag


## Comments テーブル
|Column        |Type       |Options                        |
|--------------|-----------|-------------------------------|
|topic_content |text       |null: false                    |
|user          |references |null: false, foreign_key: true |
|topic         |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :comment
- has_many :likes


## Likes テーブル
|Column  |Type       |Options                        |
|--------|-----------|-------------------------------|
|user    |references |null: false, foreign_key: true |
|comment |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :comment


## Relationships テーブル
|Column    |Type       |Options                        |
|----------|-----------|-------------------------------|
|following |references |null: false, foreign_key: true |
|follower  |references |null: false, foreign_key: true |

### Association
- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"
- has_many :followings, through: :active_relationships, source: :follower
- has_many :followers, through: :passive_relationships, source: :following


# 画面遷移図
  現在作成中
# 開発環境
  Ruby/Ruby on Rails/MySQL/Github/Render/Visual Studio Code
# ローカルでの動作方法
  以下のコマンドを順に実行。<br>
  % git clone https://github.com/mispica/teacher_talk.git<br>
  % cd teacher_talk<br>
  % bundle install<br>
  % yarn install<br>
# 工夫したポイント
  現在作成中

