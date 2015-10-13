class ApiV1 < Grape::API
  version 'v1', using: :path
  format :json
  prefix 'api'
  helpers V1Helpers

  DOMAIN = '172.16.1.243:9292'

  desc "Get a list of Widgets"
  get :widgets do
    widgets_response Widget.all
  end

  desc "get ping"
  get :ping do
    { ping: 'http://' + DOMAIN + api_v1_ping_path }
  end

  desc "twitter oauth test"
  get :twitter_auth do
    client = TwitterAuthClient::get_twitter_client
    request_token = client.request_token(:oauth_callback => 'http://' + DOMAIN + api_v1_twitter_auth_call_back_path)
    cookies[:ttoken] = request_token.token
    cookies[:tsec] = request_token.secret
    redirect request_token.authorize_url
  end

  desc "post pin"
  get :twitter_auth_call_back do
    unless cookies[:ttoken] && cookies[:tsec]
      # cookie が入ってない場合のエラー
    end
    client = TwitterAuthClient::get_twitter_client(
      :token => cookies[:ttoken],
      :secret => cookies[:tsec]
    )
    access_token = client.authorize(
      cookies[:ttoken],
      cookies[:tsec],
      :oauth_verifier => params[:oauth_verifier]
    )

    unless client.authorized?
      # auth 失敗時のエラー
    end

    cookies.delete :ttoken
    cookies.delete :tsec

    user = login_user(access_token.params)

    {
      status: 1,
      site_token: user.site_token
    }
  end
end
