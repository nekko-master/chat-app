class CreateRooms < ActiveRecord::Migration[7.1] # マイグレーション用のクラス。ActiveRecord::Migrationを継承している
  def change  # マイグレーション時に呼び出されるメソッド。up/downの両方に対応できる
    create_table :rooms do |t|  # rooms というテーブルを作成し、t というテーブル定義用オブジェクトを使う
      t.string :name, null: false # name という文字列型カラムを追加し、null: false で「必ず値が必要」と制約をつける
      t.timestamps  # created_at と updated_at の2つの日時カラムを自動で追加する
    end
  end
end
