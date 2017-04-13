class GroupsController < ApplicationController
  def edit
  end

  def new
    @group = Group.new
  end

  def create
    Group.create(group_params)
    redirect_to :root
  end

  private
    def group_params
      params.require(:group).permit(:name, { :user_ids => [] })
    end
end
