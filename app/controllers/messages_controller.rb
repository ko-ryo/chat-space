class MessagesController < ApplicationController

  before_action :set_group, only: [:index, :create]

  def index
    @groups = current_user.groups
    @message = Message.new
    @messages = Message.all
  end

  def create
    @message = Message.new(body: message_params[:body], group_id: @group.id, user_id: current_user.id)
    if @message.save
      redirect_to :back, success: "メッセージの送信に成功しました。"
    else
      flash.now[:warning] = "メッセージの送信に失敗しました。"
      render :new
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
