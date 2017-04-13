class GroupsController < ApplicationController
  def edit
  end

  def new
    @group = Group.new
  end

  def create
    Group.create(group_params)
    redirect_to controller: :messages, action: :index
  end

  private
    def group_params
      params.require(:group).permit(:name)
    end
end
