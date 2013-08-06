class SessionsController < ApplicationController
  def index
  end

  def new
    redirect_to oauth_client.auth_code.authorize_url(:scope => "user,user:email")
  end

  def oauth2callback
    if params[:code]
      token = oauth_client.auth_code.get_token(params[:code], :redirect_uri => 'http://localhost:3000/oauth2callback')
      debugger
      # at this point, we'd store our user info, create a session and current_user, etc.

      # this is really stupid -- we'd do something a bit more reasonable here -- just for testing
      client = Octokit::Client.new(:login => "jeffreywescott", :oauth_token => token.token)
      ruby_file = client.contents('octokit/octokit.rb', :path => 'README.md', :accept => 'application/vnd.github.html')

      render :text => ruby_file
    else
      render :text => "Unauthorized", :status => :unauthorized # 401
    end
  end

  private

  def oauth_client
    @client ||= OAuth2::Client.new(
      'd33cc50df55abe61d511', # client ID
      'b19484a774ae4e552e9183c5127f1410b1eed4d7', # client secret
      :site => 'https://github.com',
      :token_url => '/login/oauth/access_token',
      :authorize_url => '/login/oauth/authorize'
    )
  end
end
