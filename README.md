

### users テーブル

| Column              | Type    | Options                  |
| ------------------- | ------- | ------------------------ |
| id                  | string  | null: false              |
| nickname            | string  | null: false              |
| email               | string  | null: false, unique: true|
| encrypted_password  | string  | null: false              |



### cloudies テーブル

| Column                | Type             | Options                        |
| ----------------------| ---------------- | ------------------------------ |
| id                    | references       | null: false, foreign_key: true |
| name                  | references       | null: false, foreign_key: true |
| text                  | references       | null: false, foreign_key: true |
| user_id               | references       | null: false, foreign_key: true |
| adress                | references       |                                |
| latitude              | references       |                                |
| longitude             | references       |                                |


### likes テーブル

| Column                | Type             | Options                        |
| ----------------------| ---------------- | ------------------------------ |
| id                    | references       | null: false                    |
| user_id               | references       | null: false, foreign_key: true |
| cloudy_id             | references       | null: false, foreign_key: true |


### comments テーブル

| Column                | Type             | Options                        |
| ----------------------| ---------------- | ------------------------------ |
| id                    | references       | null: false                    |
| user_id               | references       | null: false, foreign_key: true |
| cloudy_id             | references       | null: false, foreign_key: true |
| text                  | references       | null: false, foreign_key: true |




アプリケーション名: Cloudy Service	
アプリケーション概要: 雲の写真を投稿するサイト
URL:https://github.com/Re-OKMT/cloudy_service/issues/1
テスト用アカウント:
利用方法	ユーザーの登録後画像を送信する
目指した課題解決	地上からの雲の形を確認し投稿し合うアプリ
洗い出した要件	画像、ログインネーム、パスワード、いいね
実装した機能についての画像やGIFおよびその説明	
実装予定の機能  ・１時間に１枚しか投稿できないように条件をつけること
              ・位置情報を自動入力したい
データベース設計	ER図等を開発中
