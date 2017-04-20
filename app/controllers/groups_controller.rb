class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]

  def show
    @groups = current_user.groups
    @messages = Message.includes(:group)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, success: "グループ作成に成功しました。"
    else
      flash.now[:warning] = "グループ作成に失敗しました。"
      render :new
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to :root, success: "編集が完了しました。"
    else
      flash.now[:warning] = "編集に失敗しました。"
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
