class MessagesController < ApplicationController

  before_action :set_group, only: [:index, :create]

  def index
    @message = Message.new
    @messages = Message.all
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      flash[:notice] = "メッセージの送信に成功しました。"
      redirect_to action: :index
    else
      flash.now[:notice] = "メッセージを入力してください。"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:body).merge(group_id: @group.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.includes(:messages)
  end
end
