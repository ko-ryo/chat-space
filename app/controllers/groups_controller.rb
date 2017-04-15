class GroupsController < ApplicationController

  before_action :set_group, only: [:index, :edit, :update]

  def index
  end

  def new
    @group = Group.new
  end

  def create
    if Group.create(group_params)
      redirect_to :root, success: "グループ作成に成功しました。"
    else
      flash.now[:warning] = "グループ作成に失敗しました。"
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to :root, success: "編集が完了しました。"
    else
      flash.now[:warning] = "編集に失敗しました。"
      render :action => "edit"
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
