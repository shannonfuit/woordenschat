CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIXCE63QUSZU2IKMQ',                        # required
    :aws_secret_access_key  => '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',                        # required
   
  config.fog_directory  = 'taaltelt'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end