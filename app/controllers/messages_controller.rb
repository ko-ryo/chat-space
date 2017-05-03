class MessagesController < ApplicationController

  before_action :set_group, only: [:index, :create]

  def index
    @message = Message.new
    @messages = @group.messages.includes(:user)
    respond_to do |format|
      format.html { render :index }
      format.json
    end
  end

  def create
    @message = current_user.messages.new(message_params)
    @message.group = @group
    @message.user = current_user
    respond_to do |format|
      if @message.save
        format.html { redirect_to group_messages_path(@group), notice: "メッセージを送信しました。" }
        format.json
      else
        format.html { redirect_to group_messages_path(@group), notice: "メッセージを入力してください。" }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
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
