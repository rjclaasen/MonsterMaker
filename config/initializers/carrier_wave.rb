CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      # Configuration for Amazon S3
      :provider              => 'AWS',
      :region                => ENV.fetch('S3_REGION'),
      :aws_access_key_id     => ENV.fetch('S3_ACCESS_KEY'),
      :aws_secret_access_key => ENV.fetch('S3_SECRET_KEY')
    }
    config.fog_directory     =  ENV.fetch('S3_BUCKET')
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end
