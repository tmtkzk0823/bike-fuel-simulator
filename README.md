# バイク航続距離シュミレーター

## ■ サービス概要
ツーリングしたいけれど、知らない場所で給油することは手間だと感じている人に
乗っているバイクの燃費から無給油で行ける目的地を提示してくれる
ルート表示サービスです

### メインのターゲットユーザー
- ツーリングをする人
- 旧車や大型ssのようなガソリンメーターの表示がないバイクを所持しているライダー
- ツーリングに初めて行く人

### ユーザーが抱える問題
ツーリングに行った際、長い距離を走りたいが土地勘のない場所でガソリンスタンドを探すのが手間である

### 解決方法
乗っているバイクの航続距離でいける範囲の場所を検索できれば、給油のことを考えないで済むと思った。

### 実装予定機能
- ログイン前
  - バイクごとの航続距離表示
  - googlemapによる無給油で行ける場所の一覧表示
  - 選択した場所までのルート表示
  - 中間地点等にある休憩スポット提案
- ログイン後
  - 行ったことのある場所のリスト化
  - 自分の所有するバイク情報の登録

### なぜこのサービスを作りたいのか
ツーリングに行った際、土地勘のない所でガソリンスタンド等を探すのを手間に思うことがある反面、できるだけ長い距離を走りたいを思うことがあり、それならば、航続距離から行ける場所がわかればいいと思いこのサービスを作りたいと思いました。

### スケジュール
  - 企画 ~ 技術調査：8/5
  -  README ~ ER図作成：8/10 〆切り
  - メイン機能実装：8/10 ~ 9/15 
  - MVPリリース：9/15〆切り
  - 本番リリース：9月下旬


### 画面遷移図
[Figmaによる画面遷移図](https://www.figma.com/file/tB9FYyamcDmlHXOAkKnisY/RUNTEQ-PF?node-id=0%3A1)


### ER図
[![Image from Gyazo](https://i.gyazo.com/23bd2a755d108e69e4cf4faa6243db84.png)](https://gyazo.com/23bd2a755d108e69e4cf4faa6243db84)