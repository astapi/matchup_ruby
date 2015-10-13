class ApiV1 < Grape::API
  version 'v1', using: :path
  format :json
  prefix 'api'
  helpers V1Helpers

  params do
    requires :site_token, type: String, desc: 'site_token'
  end
  desc "get my profile"
  get :profile do
    # todo: site_tokenのcookiesとの整合性 DBにあるかどうか
    if user = User.find_by(:site_token => params[:site_token])
      {
        user: {
          id: user.id,
          twitter_screen_name: user.twitter_screen_name,
        }
      }
    else
      {
        status: 'user not found'
      }
    end
  end

  params do
    requires :site_token, type: String, desc: 'site_token'
    requires :user_id, type: String, desc: 'user_id'
  end
  desc "get other profile"
  get :user do
    # todo: site_tokenのcookiesとの整合性 DBにあるかどうか
    if user = User.eager_load(:follows).find_by(:id => params[:user_id])
      follower_count = Follow.where(:follower_id => user.id).count('*')
      {
        user: {
          id: user.id,
          twitter_screen_name: user.twitter_screen_name,
          follow_count: user.follows.count,
          follower_count: follower_count,
        }
      }
    else
      {
        status: 'user not found'
      }
    end
  end

  params do
    requires :site_token, type: String, desc: 'site_token'
    requires :user_id, type: String, desc: 'user_id'
  end
  desc "follow user"
  get :follow_user do
    # todo: site_tokenのcookiesとの整合性 DBにあるかどうか
    user = User.find_by(:site_token => params[:site_token])
    # user がいなかった場合のエラー処理
    follow = Follow.new.tap do |f|
      f.user_id = user.id
      f.follower_id = params[:user_id]
    end
    unless follow.save!
      # follow 失敗時のエラー
      p 'follow failed'
    end
    {
      status: 'success'
    }
  end

  params do
    requires :site_token, type: String, desc: 'site_token'
  end
  desc "search user"
  get :search_user do
    # todo: site_tokenのcookiesとの整合性 DBにあるかどうか
    User.select(:id,:twitter_screen_name)
  end

  params do
    requires :site_token, type: String, desc: 'site_token'
  end
  desc "add play game"
  get :add_play_game do
    # todo: site_tokenのcookiesとの整合性 DBにあるかどうか
    user = User.find_by(:site_token => params[:site_token])
    # user がいなかった場合のエラー処理
    pg = PlayGame.new.tap do |pg|
      pg.user_id = user.id
      pg.game_mst_id = params[:game_id]
      pg.point = params[:point]
    end
    if pg.save!
      {
        status: 'success'
      }
    else
      {
        status: 'error'
      }
    end
  end

  params do
    requires :site_token, type: String, desc: 'site_token'
  end
  get :add_play_character do
    # todo: site_tokenのcookiesとの整合性 DBにあるかどうか
    user = User.find_by(:site_token => params[:site_token])
    # user がいなかった場合のエラー処理
    pc = PlayCharacter.new.tap do |pc|
      pc.user_id = user.id
      pc.character_mst_id = params[:character_id]
      pc.main_flg = params[:main_flg]
    end
    if pc.save!
      {
        status: 'success'
      }
    else
      {
        status: 'error'
      }
    end
  end
end
