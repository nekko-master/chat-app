require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @Message = FactoryBot.build(:message)
  end

  describe "メッセージ投稿" do
    context "メッセージが投稿できる場合" do
      it "contentとimageが存在していれば保存できる" do
        expect(@Message).to be_valid
      end
      it "contentが空でも保存できる" do
        @Message.content = " "
        expect(@Message).to be_valid
      end
      it "imageが空でも保存できる" do
        @Message.image = nil
        expect(@Message).to be_valid
      end
    end

    context "メッセージが投稿できない場合" do
      it "contentとimageが空では保存できない" do
        @Message.content = " "
        @Message.image = nil
        @Message.valid?
        expect(@Message.errors.full_messages).to include "Content can't be blank"
      end
      it "roomが紐付いていないと保存できない" do
        @Message.room = nil
        @Message.valid?
        expect(@Message.errors.full_messages).to include "Room must exist"
      end
      it "userが紐付いていないと保存できない" do
        @Message.user = nil
        @Message.valid?
        expect(@Message.errors.full_messages).to include "User must exist"
      end
    end
  end
end
