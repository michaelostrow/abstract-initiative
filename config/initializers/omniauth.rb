def access_token
  require 'open-uri'
  open("https://graph.facebook.com/oauth/access_token?client_id=741971319163209&client_secret=bf7a4109fcc2b72f2981a0da594786ae&grant_type=client_credentials") do |f| 
    return f.read.gsub(/^access_token=/,"")
  end
end
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "741971319163209", "bf7a4109fcc2b72f2981a0da594786ae",
  {
    :display => "popup",
    #:access_token => access_token,
    :scope => 'email, offline_access', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}} 
end
