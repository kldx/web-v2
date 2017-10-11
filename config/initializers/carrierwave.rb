CarrierWave.configure do |config|
	config.fog_credentials = {
		provider: 'AWS',
		aws_access_key_id: "#{ENV['S3_ACCESS_KEY_ID']}",
		aws_secret_access_key: "#{ENV['S3_SECRET_ACCESS_KEY']}",
		region: "us-southeast-1"
	}
  config.storage = :fog
	config.fog_directory = Settings.s3.bucket # required
	config.fog_public = true # optional, defaults to true
	config.fog_attributes = {'Cache-Control'=>'max-age=315576000'} # optional, defaults to {}
	config.cache_dir = "#{Rails.root}/tmp/uploads"

  if Rails.env.development?
    config.fog_credentials[:host] = 'localhost'
    config.fog_credentials[:endpoint] = 'http://localhost:9000'
    config.fog_credentials[:region] = "us-southeast-1"
    config.fog_credentials[:path_style] = true
  end
end

if Rails.env.test?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end
end
