class GroupsController < ApplicationController

  before_action :set_group, only: [:show, :edit, :update]

  def show
    @groups = current_user.groups.includes(:messages)
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def create
    @group = Group.new(group_params)
    respond_to do |format|
      if @group.save
        format.html {
          redirect_to group_path(@group),
          success: "グループ作成に成功しました。"
        }
        format.json {
          render :show,
          status: :created,
          location: @group
        }
      else
        format.html {
          render :new,
          flash.now[:warning] = "グループ名を入力してください。"
        }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @group.update(group_params)
        format.html {
          redirect_to group_path(@group),
          success: "グループを編集しました。"
        }
        format.json {
          render :show,
          status: :ok,
          location: @group
        }
      else
        format.html { render :edit }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
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
