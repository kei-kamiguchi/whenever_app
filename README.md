# Whenever
- 大量のデータベース更新、不要になったレコードの削除、定期的なデータ集計といったバッチ処理が可能
<br>＊バッチ処理：一連の処理をあるタイミングでまとめて実施する処理のこと
1. 以下のようにして、gem`whenever`をインストール
```
gem 'whenever', require: false

# ターミナル等で使用するgemに関しては、bundlerによってアプリ側に自動で読み込む必要がなないことから、「require: false」を設定する
```
2. 作成したメソッドを実行するタイミングを設定するファイル[config/schedule.rb]を作成
```
$ bundle exec wheneverize .
```
3. [config/schedule.rb]に実行するタイミングを設定
```
every '0 0 * * *' do
  runner "Movie.publish_check"
end
```
- タイミングの設定方法
```
# 毎日am4:30
every 1.day, at: '4:30 am' do ～ end
# 1時間毎
every :hour do ～ end
# 1分毎
every 1.minute do ~ end
# 日曜日のpm12時
every :sunday, at: '12pm' do ～ end
# 毎月27日〜31日まで0:00
every '0 0 27-31 * * ' do ～ end
```
- 命令文
  - runner：モデルに定義されたメソッドを呼び出したい場合に使用します。引数はモデル名とメソッド名をドットで連結したものを渡します。
  - command：OS上のコマンドを実行したい場合に利用します。引数にはコマンドを渡します。
  - rake：実行させたいrakeコマンドを記載します。

4. crontabに設定を反映
```
# 開発環境
$ bundle exec whenever --update-cron --set environment=development
# 本番環境
$ bundle exec whenever --update-crontab
```
## コマンド
- 登録の確認
```
$ crontab -l
```
- 登録を削除
```
$ bundle exec whenever --clear-crontab
```
- cronを停止
```
$ crontab -r
```
- cronのメールを一括削除
```
$ mail
? delete *
? q
```
## テスト
1. 以下のように記述し、gemをインストール
```
group :development, :test do
  # 省略
  gem "shoulda-whenever"
  gem "whenever-test"
end
```
