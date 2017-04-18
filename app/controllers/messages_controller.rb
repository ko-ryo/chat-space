class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @ids = current_user.group_ids
    @groups = Group.find(@ids)
  end
end
