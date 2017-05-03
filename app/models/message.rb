class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :body, presence: :true

  def to_api_json
    {
      name: user.name,
      body: body,
      time: created_at.strftime('%m/%d %p %H:%M'),
      # image_url: image.to_s
    }
  end
end
