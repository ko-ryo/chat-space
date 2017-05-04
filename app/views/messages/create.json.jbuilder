json.message do |json|
  json.name @message.user.name
  json.body @message.body
  json.time @message.created_at.to_s
  json.image_url @message.image.to_s
end
