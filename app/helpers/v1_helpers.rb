module V1Helpers
  def login_user params
    site_token = 'mogemoge'
    if user = User.find_by(:twitter_id => params[:user_id])
      user.tap do |u|
        u.oauth_token = params[:oauth_token]
        u.oauth_token_secret = params[:oauth_token_secret]
        u.site_token = 'aaaaa'
        u.site_token_limit = Time.now + 7.day
      end
    else
      user = User.new.tap do |u|
        u.twitter_id = params[:user_id]
        u.twitter_screen_name = params[:screen_name]
        u.oauth_token = params[:oauth_token]
        u.oauth_token_secret = params[:oauth_token_secret]
        u.site_token = site_token
        u.site_token_limit = Time.now + 7.day
      end
    end
    unless user.save!
      # error時の処理
      p 'save error'
    end

    cookies[:site_token] = site_token

    user
  end

  def authenticate!
    return params[:site_token] ? true : false
  end
end
