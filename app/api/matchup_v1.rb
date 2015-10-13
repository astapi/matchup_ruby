class ApiV1 < Grape::API
  version 'v1', using: :path
  format :json
  prefix 'api'
  helpers V1Helpers

  params do
    requires :site_token, type: String, desc: 'site_token'
    requires :user_id, type: Integer, desc: 'user_id'
    requires :game_id, type: Integer, desc: 'game_id'
    requires :match_rule_id, type: Integer, desc: 'match_rule_id'
    requires :one, type: DateTime, desc: 'one datetime'
  end
  desc "take match"
  get :take_match do
    # site_tokenの整合性確認
    user = User.find_by(:site_token => params[:site_token])
    # user がいなかった場合の処理

    options = {
      private: false
    }
    options.merge params
    ActiveRecord::Base.transaction do
      adoptions = {
        one: nil,
        two: nil,
        three: nil,
      }
      adoption.merge params
      at = AdjustTime.new.tap do |at|
        at.one = adoptions[:one]
        at.two = adoptions[:two]
        at.three = adoption[:three]
      end
      at.save!

      tm = TmpMatch.new.tap do |tm|
        tm.user_id = user.id
        tm.take_user_id = options[:user_id]
        tm.game_mst_id = options[:game_id]
        tm.private_flg = options[:private]
        tm.match_rule_id = options[:match_rule_id]
        tm.adjust_time_id = at.id
      end
      tm.save!
    end

    # 正常終了時
    # todo privateがfalseだった場合に timelineに投稿
  end

  params do
    requires :site_token, type: String, desc: 'site_token'
    requires :take_match_id, type: Integer, desc: 'take_match_id'
    requires :match_time, type: DateTime, desc: 'datetime'
  end
  desc "take match_kakutei"
  get :take_match_kakutei do
    # site_tokenの整合性確認
    user = User.find_by(:site_token => params[:site_token])
    # user がいなかった場合の処理

    tmpmatch = TmpMatch.find_by(:id => params[:take_match_id], :take_user_id => user.id)
    m = Match.new.tap do |m|
      m.user_id = tmpmatch.user_id
      m.take_user_id = tmpmatch.take_user_id
      m.game_mst_id = tmpmatch.game_mst_id
      m.private_flg = params[:private] ? params[:private] : tmpmatch.private_flg
      m.match_rule = tmpmatch.match_rule
      m.match_time = params[:match_time]
      m.like_count = 0
    end
    unless m.save!
      # error時の処理
    end
    # 正常時の処理
    {
      status: 'suceess'
    }
  end
end
