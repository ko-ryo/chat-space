class GroupsController < ApplicationController

  before_action :set_group, only: [:index, :edit, :update]

  def index
  end

  def new
    @group = Group.new
  end

  def create
    Group.create(group_params)
    redirect_to :root
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to :root, success: "編集が完了しました。"
    else
      redirect_to :action => "edit", warning: "編集に失敗しました。"
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
