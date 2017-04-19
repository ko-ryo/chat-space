class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :groups_users
  has_many :groups, through: :groups_users
  has_many :messages
  accepts_nested_attributes_for :groups_users
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
