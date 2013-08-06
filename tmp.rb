client = OAuth2::Client.new(
  'd33cc50df55abe61d511',
  'b19484a774ae4e552e9183c5127f1410b1eed4d7',
  :site => 'https://github.com',
  :token_url => '/login/oauth/token',
  :authorize_url => '/login/oauth/authorize'
)