class RoomsController < ApplicationController # Rooms コントローラー。ApplicationController を継承
  def new # new アクション（新規作成フォームを表示するときに呼ばれる）
    @room = Room.new  # Room モデルの空のインスタンスを作成し、@room に代入
  end                 # このインスタンスはビュー(new.html.erb)でフォーム生成に使用される

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, user_ids: [])
  end
end
