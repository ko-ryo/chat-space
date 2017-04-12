class GroupsController < ApplicationController
  def edit
  end

  def new
    @group = Group.new
  end
  # ビューファイルの表示
end
