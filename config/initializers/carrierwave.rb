require 'dotenv'
Dotenv.load

CarrierWave.configure do |config|
  config.fog_provider = 'fog'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_REGION']
  }

  config.fog_directory = ENV['AWS_S3_BUCKET']
  config.cache_storage = :fog
  config.asset_host = ENV['S3_ASSET_HOST'] + '/' + ENV['AWS_S3_BUCKET']
end
