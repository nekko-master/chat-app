class RoomsController < ApplicationController # Rooms コントローラー。ApplicationController を継承
  def new # new アクション（新規作成フォームを表示するときに呼ばれる）
    @room = Room.new  # Room モデルの空のインスタンスを作成し、@room に代入
  end                 # このインスタンスはビュー(new.html.erb)でフォーム生成に使用される
end
