class GroupsUser < ApplicationRecord
  belongs_to :user
  belongs_to :group

  # validates :group, presence: true
  # validates :user, presence: true
end
