json.message do
  json.name @message.user.name
  json.body @message.body
  json.time @message.created_at.strftime('%m/%d %p %H:%M')
  json.image_url @message.image.to_s
end
