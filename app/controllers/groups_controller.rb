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
        # binding.pry
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
          redirect_to new_group_path(@group)
          flash.now[:warning] = "グループ名を入力してください。"
        }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
        # if @group.save
    #   redirect_to :root, success: "グループ作成に成功しました。"
    # else
    #   flash.now[:warning] = "グループ作成に失敗しました。"
    #   render :new
    # end
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
    # if @group.update(group_params)
    #   redirect_to :root, success: "編集が完了しました。"
    # else
    #   flash.now[:warning] = "編集に失敗しました。"
    #   render :edit
    # end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
