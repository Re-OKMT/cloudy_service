

### users テーブル

| Column              | Type    | Options                  |
| ------------------- | ------- | ------------------------ |
| name                | string  | null: false              |
| email               | string  | null: false, unique: true|
| encrypted_password  | string  | null: false              |



### items テーブル

| Column                | Type             | Options                        |
| ----------------------| ---------------- | ------------------------------ |
| user                  | references       | null: false, foreign_key: true |
| image                 | references       | null: false, foreign_key: true |

アプリケーション名: Cloudy Service	
アプリケーション概要: 画像を投稿した場所のGPSがわかる
URL:
テスト用アカウント:
利用方法	ユーザーの登録後画像を送信する
目指した課題解決	気象衛星のように上空からの雲の様子だけではなく地上からも撮影することで天気予報の汎用性を高める
洗い出した要件	
実装した機能についての画像やGIFおよびその説明	
実装予定の機能	・１時間に１枚しか投稿できないように条件をつけること
              ・誰でも投稿すれば特になるように１枚あたり１円orポイント制にしたい。クラウドファインディングとの連携も面白いかも
データベース設計	ER図等を開発中
